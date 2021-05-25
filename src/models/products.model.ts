import { Request } from 'express'
import { pool } from '../config/db.config'

export const getProductsModel = (): any => {
  pool.query('SELECT * FROM products ORDER BY id ASC', (error, results) => {
    if (error) {
      throw error
    }
    return results.rows
  })
}

export const getProductByIdModel = (id: string): any => {
  pool.query('SELECT * FROM products WHERE id = $1', [id], (error, results) => {
    if (error) {
      throw error
    }
    return results.rows
  })
}

export const getProductByCategoryModel = (category: string): any => {
  pool.query(
    'SELECT * FROM products WHERE category = $1',
    [category],
    (error, results) => {
      if (error) {
        throw error
      }
      return results.rows
    },
  )
}

export const createProductModel = (req: Request): any => {
  const { name, code, price, category, image, enabled } = req.body

  pool.query(
    `INSERT INTO products (name, code, price, category, image, enabled) VALUES ($1, $2, $3, $4, $5, $6)`,
    [name, code, price, category ?? null, image ?? null, enabled ?? true],
    (error, results) => {
      if (error) {
        throw error
      }
      return { message: 'New product added' }
    },
  )
}

export const updateProductModel = (req: Request): any => {
  const id = parseInt(req.params.id)
  const { name, code, price, category, image, enabled } = req.body

  pool.query(
    `UPDATE products SET name = $1, code = $2, price = $3, category = $4, image = $5, enabled = $6 WHERE id = $7`,
    [name, code, price, category, image, enabled, id],
    (error, _results) => {
      if (error) {
        throw error
      }
      return { message: `Product modified with ID: ${id}` }
    },
  )
}

export const deleteProductModel = (id: number): any => {
  pool.query('DELETE FROM products WHERE id = $1', [id], (error, _results) => {
    if (error) {
      throw error
    }
    return { message: `Product deleted with ID: ${id}` }
  })
}
