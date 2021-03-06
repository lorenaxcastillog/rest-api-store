import { Request } from 'express'
import { QueryResultRow } from 'pg'
import { NextFunctionCustom, RequestCustom } from '../../types/customTypes'
import { pool } from '../config/db.config'

export const updateNewProductsStock = (
  newProducts: any,
  next: NextFunctionCustom,
) => {
  let updateStockQuery = ''
  const requestProductsIds: any = []
  for (const product of newProducts) {
    updateStockQuery += `WHEN ${product.id} THEN ${product.stock} `
    requestProductsIds.push(product.id)
  }

  pool.query(
    `UPDATE products SET stock = CASE id ${updateStockQuery} ELSE stock END
        WHERE id IN (${requestProductsIds})`,
    [],
    (error, results) => {
      if (error) {
        return next(error, null)
      }
      return next(null, { message: `${results.rowCount} products updated` })
    },
  )
}

export const validateAndGetNewProductStockModel = (
  req: Request,
  next: NextFunctionCustom,
) => {
  const requestProducts = req.body.products
  const requestProductsIds: any = []
  const requestProductsStock: any = {}

  for (const product of requestProducts) {
    if (product.quantity <= 0) {
      return next(
        {
          message: `You must specify a positive quantity for product: ${product.name}`,
        },
        null,
      )
    }
    requestProductsIds.push(product.id)
    requestProductsStock[product.id] = product.quantity
  }

  pool.query(
    `SELECT id, name, stock, price FROM products WHERE id IN (${requestProductsIds.toString()})`,
    [],
    (error, results) => {
      if (error) {
        return next(error, null)
      }

      const outOfStock = []
      const newStock = []
      let total = 0

      for (const resProduct of results.rows) {
        if (resProduct.stock === 0) {
          outOfStock.push(resProduct.name)
        } else {
          if (resProduct.stock < requestProductsStock[resProduct.id]) {
            return next(
              {
                message: `The stock is not enough for product: ${resProduct.name}`,
              },
              null,
            )
          }
          total += resProduct.price * requestProductsStock[resProduct.id]
          newStock.push({
            id: resProduct.id,
            stock: resProduct.stock - requestProductsStock[resProduct.id],
          })
        }
      }
      if (outOfStock.length !== 0) {
        return next(
          {
            message: `The following products are out of stock: ${outOfStock.toString()}`,
          },
          null,
        )
      }
      updateNewProductsStock(
        newStock,
        (error: Error, results: QueryResultRow) => {
          if (error) {
            return next(error, null)
          }
          return next(null, { ...results, total: total.toFixed(2) })
        },
      )
    },
  )
}

export const createOrderDetailsModel = (
  id_order: number,
  products: [any],
  next: NextFunctionCustom,
) => {
  let values = ''
  for (const i in products) {
    values += ` (${id_order}, ${products[i].id}, ${products[i].quantity}, ${products[i].price})`
    if (parseInt(i) !== products.length - 1) {
      values += ','
    }
  }
  pool.query(
    `INSERT INTO order_details (id_order, id_product, quantity, price) 
      VALUES ${values} RETURNING id`,
    [],
    (error, results) => {
      if (error) {
        return next(error, null)
      }
      return next(null, results.rows[0].id)
    },
  )
}

export const createOrderModel = (
  id_user: number,
  total: number,
  next: NextFunctionCustom,
) => {
  const date = new Date()
  pool.query(
    `INSERT INTO orders (id_user, date, total) VALUES ($1, $2, $3) RETURNING id`,
    [id_user, date, total],
    (error, results) => {
      if (error) {
        return next(error, null)
      }
      return next(null, results.rows[0].id)
    },
  )
}

export const getOrdersModel = (
  req: RequestCustom,
  next: NextFunctionCustom,
) => {
  const id = req.user.id
  const role = req.user.role
  if (role === 'manager') {
    pool.query(`SELECT * FROM orders`, [], (error, results) => {
      if (error) {
        return next(error, null)
      }
      return next(null, results.rows)
    })
  }
  if (role === 'client') {
    pool.query(
      `SELECT * FROM orders WHERE id_user = $1`,
      [id],
      (error, results) => {
        if (error) {
          return next(error, null)
        }
        return next(null, results.rows)
      },
    )
  }
}

export const orderDetailsModel = (req: Request, next: NextFunctionCustom) => {
  const id = parseInt(req.body.id)
  pool.query(
    `SELECT * FROM orders WHERE id_order = $1`,
    [id],
    (error, results) => {
      if (error) {
        return next(error, null)
      }
      return next(null, results.rows)
    },
  )
}
