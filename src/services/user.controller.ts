import { Request, Response } from 'express'
import { pool } from '../config/db.config'

export const getUsers = (req: Request, res: Response): any => {
  pool.query('SELECT * FROM users ORDER BY id ASC', (error, results) => {
    if (error) {
      throw error
    }
    return res.status(200).json(results.rows)
  })
}

export const getUserById = (req: Request, res: Response): any => {
  const id = req.params.id
  pool.query('SELECT * FROM users WHERE id = $1', [id], (error, results) => {
    if (error) {
      throw error
    }
    return res.status(200).json(results.rows)
  })
}

export const createUser = (req: Request, res: Response): any => {
  const { name, email, password } = req.body

  pool.query(
    `INSERT INTO users (name, email, password) VALUES ($1, $2, $3)`,
    [name, email, password],
    (error, results) => {
      if (error) {
        throw error
      }
      res.status(201).json(`User added`)
    },
  )
}

export const deleteUser = (req: Request, res: Response): any => {
  const id = parseInt(req.params.id)

  pool.query('DELETE FROM users WHERE id = $1', [id], (error, _results) => {
    if (error) {
      throw error
    }
    res.status(200).send(`User deleted with ID: ${id}`)
  })
}
