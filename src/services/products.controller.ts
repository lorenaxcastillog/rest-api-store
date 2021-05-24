import { Request, Response } from 'express'
import { pool } from '../config/db.config'

export const getProducts = (req: Request, res: Response): any => {
  pool.query('SELECT * FROM products ORDER BY id ASC', (error, results) => {
    if (error) {
      throw error
    }
    return res.status(200).json(results.rows)
  })
}

export const getProductById = (req: Request, res: Response): any => {
  const id = req.params.id
  pool.query('SELECT * FROM products WHERE id = $1', [id], (error, results) => {
    if (error) {
      throw error
    }
    return res.status(200).json(results.rows)
  })
}

export const getProductByCategory = (req: Request, res: Response): any => {
  const category = req.params.category
  pool.query(
    'SELECT * FROM products WHERE category = $1',
    [category],
    (error, results) => {
      if (error) {
        throw error
      }
      return res.status(200).json(results.rows)
    },
  )
}

export const createProduct = (req: Request, res: Response): any => {
  const { name, code, price, category, image, enabled } = req.body

  pool.query(
    `INSERT INTO products (name, code, price, category, image, enabled) VALUES ($1, $2, $3, $4, $5, $6)`,
    [name, code, price, category ?? null, image ?? null, enabled ?? true],
    (error, results) => {
      if (error) {
        throw error
      }
      res.status(201).json(`New product added`)
    },
  )
}

export const updateProduct = (req: Request, res: Response): any => {
  const id = parseInt(req.params.id)
  const { name, code, price, category, image, enabled } = req.body

  pool.query(
    `UPDATE products SET name = $1, code = $2, price = $3, category = $4, image = $5, enabled = $6 WHERE id = $7`,
    [name, code, price, category, image, enabled, id],
    (error, _results) => {
      if (error) {
        throw error
      }
      res.status(200).send(`Product modified with ID: ${id}`)
    },
  )
}

export const deleteProduct = (req: Request, res: Response): any => {
  const id = parseInt(req.params.id)

  pool.query('DELETE FROM products WHERE id = $1', [id], (error, _results) => {
    if (error) {
      throw error
    }
    res.status(200).send(`Product deleted with ID: ${id}`)
  })
}
