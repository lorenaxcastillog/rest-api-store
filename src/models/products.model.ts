import { Request } from 'express'
import { QueryResultRow } from 'pg'
import { NextFunctionCustom, RequestCustom } from '../../types/customTypes'
import { pool } from '../config/db.config'

export const getTotalEnabledProductsCountModel = async (): Promise<any> => {
  const results = await pool.query(
    'SELECT COUNT(id) FROM products WHERE enabled = true',
  )
  return parseInt(results.rows[0].count)
}

export const getProductsModel = async (
  req: Request,
  next: NextFunctionCustom,
): Promise<any> => {
  const { offset, limit } = req.body
  pool.query(
    'SELECT * FROM products ORDER BY id ASC OFFSET $1 LIMIT $2',
    [offset ?? 0, limit ?? 10],
    (error, results) => {
      if (error) {
        return next(error, null)
      }
      return next(null, results.rows)
    },
  )
}

export const getProductByIdModel = (id: number, next: NextFunctionCustom) => {
  pool.query('SELECT * FROM products WHERE id = $1', [id], (error, results) => {
    if (error) {
      return next(error, null)
    }
    return next(null, results.rows)
  })
}

export const getProductsByCategoryModel = (
  categoryId: number,
  next: NextFunctionCustom,
) => {
  pool.query(
    `SELECT products.id, products.name, products.price, products.image, products.enabled, products.stock
        FROM products JOIN products_categories 
          ON products.id = products_categories.id_product 
            WHERE products_categories.id_category = $1 AND products.enabled = true`,
    [categoryId],
    (error, results) => {
      if (error) {
        return next(error, null)
      }
      return next(null, results.rows)
    },
  )
}

export const createProductModel = (
  req: RequestCustom,
  next: NextFunctionCustom,
) => {
  const { name, price, categoryId, image, enabled, stock } = req.body
  const role = req.user.role
  if (role === 'client') {
    return next({ message: 'You are not authorized to do this' }, null)
  }
  pool.query(
    `INSERT INTO products (name, price, image, enabled, stock) VALUES ($1, $2, $3, $4, $5) RETURNING id`,
    [name, price, image ?? null, enabled ?? true, stock],
    (error, results) => {
      if (error) {
        return next({ message: 'Error creating product' }, null)
      }
      const productId = results.rows[0].id
      pool.query(
        `INSERT INTO products_categories (id_product, id_category) VALUES($1, $2)`,
        [productId, categoryId],
        (error, _results) => {
          if (error) {
            return next({ message: 'Error creating product' }, null)
          }
          return next(null, {
            message: `New product added with ID: ${productId}`,
          })
        },
      )
    },
  )
}

export const updateProductModel = (
  req: RequestCustom,
  next: NextFunctionCustom,
) => {
  const id = parseInt(req.params.id)
  const { name, price, image, enabled, stock } = req.body
  const role = req.user.role
  if (role === 'client') {
    return next({ message: 'You are not authorized to do this' }, null)
  }
  getProductByIdModel(id, (error: Error, results: QueryResultRow) => {
    if (error) {
      return next(error, null)
    }
    if (results.length === 0) {
      return next(new Error(), null)
    }
    pool.query(
      `UPDATE products SET name = $1, price = $2, image = $3, enabled = $4, stock = $5 WHERE id = $6`,
      [name, price, image, enabled, stock, id],
      (error, _results) => {
        if (error) {
          return next(error, null)
        }
        return next(null, { message: `Product modified with ID: ${id}` })
      },
    )
  })
}

export const likeProductModel = (
  req: RequestCustom,
  next: NextFunctionCustom,
) => {
  const id_user = req.user.id
  const { id_product, likes } = req.body
  pool.query(
    `INSERT INTO likes_users_products (id_user, id_product, likes) VALUES ($1, $2, $3) 
      ON CONFLICT (id_user, id_product) DO UPDATE SET id_user = $1, id_product = $2, likes = $3`,
    [id_user, id_product, likes],
    (error, _results) => {
      if (error) {
        return next(error, null)
      }
      return next(null, {
        data: { id_user, id_product, likes },
      })
    },
  )
}

export const deleteProductModel = (
  req: RequestCustom,
  next: NextFunctionCustom,
) => {
  const id = parseInt(req.params.id)
  const role = req.user.role
  if (role === 'client') {
    return next({ message: 'You are not authorized to do this' }, null)
  }
  pool.query(
    'DELETE FROM products_categories WHERE id_product = $1',
    [id],
    (error, _results) => {
      if (error) {
        return next({ message: 'Error deleting product' }, null)
      }
      pool.query(
        'DELETE FROM products WHERE id = $1',
        [id],
        (error, _results) => {
          if (error) {
            return next({ message: 'Error deleting product' }, null)
          }
          return next(null, { message: `Product deleted with ID: ${id}` })
        },
      )
    },
  )
}
