import { Request } from 'express'
import { pool } from '../config/db.config'

export const getTotalEnabledProductsCountModel = async (): Promise<any> => {
  const results = await pool.query(
    'SELECT COUNT(id) FROM products WHERE enabled = true',
  )
  return parseInt(results.rows[0].count)
}

export const getProductsModel = async (
  req: Request,
  next: any,
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

export const getProductByIdModel = (id: number, next: any): any => {
  pool.query('SELECT * FROM products WHERE id = $1', [id], (error, results) => {
    if (error) {
      return next(error, null)
    }
    return next(null, results.rows)
  })
}

export const getProductsByCategoryModel = (
  categoryId: number,
  next: any,
): any => {
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

export const createProductModel = (req: Request, next: any): any => {
  const { name, price, categoryId, image, enabled, stock } = req.body
  pool.query(
    `INSERT INTO products (name, price, image, enabled, stock) VALUES ($1, $2, $3, $4, $5) RETURNING id`,
    [name, price, image ?? null, enabled ?? true, stock],
    (error, results) => {
      if (error) {
        return next(error, null)
      }
      const productId = results.rows[0].id
      pool.query(
        `INSERT INTO products_categories (id_product, id_category) VALUES($1, $2)`,
        [productId, categoryId],
        (error, _results) => {
          if (error) {
            return next(error, null)
          }
          return next(null, {
            message: `New product added with ID: ${productId}`,
          })
        },
      )
    },
  )
}

export const updateProductModel = (req: Request, next: any): any => {
  const id = parseInt(req.params.id)
  const { name, price, image, enabled, stock } = req.body

  getProductByIdModel(id, (error: Error, results: any) => {
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

export const deleteProductModel = (id: number, next: any): any => {
  pool.query(
    'DELETE FROM products_categories WHERE id_product = $1',
    [id],
    (error, _results) => {
      if (error) {
        return next(error, null)
      }
      pool.query(
        'DELETE FROM products WHERE id = $1',
        [id],
        (error, _results) => {
          if (error) {
            return next(error, null)
          }
          return next(null, { message: `Product deleted with ID: ${id}` })
        },
      )
    },
  )
}
