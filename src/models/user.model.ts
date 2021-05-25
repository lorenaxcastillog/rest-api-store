import { Request } from 'express'
import { pool } from '../config/db.config'
import { encryptPassword } from '../utils/auth'

export const createUserModel = async (
  req: Request,
  next: any,
): Promise<any> => {
  const { name, email, password } = req.body
  const hashPassword = await encryptPassword(password)
  pool.query(
    `INSERT INTO users (name, email, password) VALUES ($1, $2, $3) RETURNING id`,
    [name, email, hashPassword],
    (error, results) => {
      if (error) {
        return next(error, null)
      }
      return next(null, results.rows[0].id)
    },
  )
}

export const getUsersModel = (next: any): any => {
  pool.query('SELECT * FROM users ORDER BY id ASC', async (error, results) => {
    if (error) {
      return await next(error, null)
    }
    return await next(null, results.rows)
  })
}

export const getUserByEmailModel = (email: string, next: any): any => {
  pool.query(
    'SELECT * FROM users WHERE email = $1',
    [email],
    (error, results) => {
      if (error) {
        return next(error, null)
      }
      return next(null, results.rows[0])
    },
  )
}

export const getUserByIdModel = (id: number, next: any): any => {
  pool.query('SELECT * FROM users WHERE id = $1', [id], (error, results) => {
    if (error) {
      return next(error, null)
    }
    return next(null, results.rows[0])
  })
}

export const deleteUserModel = (id: number, next: any): any => {
  pool.query('DELETE FROM users WHERE id = $1', [id], (error, _results) => {
    if (error) {
      return next(error, null)
    }
    return next(null, id)
  })
}
