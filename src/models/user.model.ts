import { Request } from 'express'
import { NextFunctionCustom, RequestCustom } from '../../types/customTypes'
import { pool } from '../config/db.config'
import { encryptPassword } from '../utils/auth'

export const createSessionModel = (token: string, next: NextFunctionCustom) => {
  pool.query(
    `INSERT INTO sessions (token) VALUES ($1)`,
    [token],
    (error, _results) => {
      if (error) {
        return next(error, false)
      }
      return next(null, true)
    },
  )
}

export const searchSessionModel = (token: string, next: NextFunctionCustom) => {
  pool.query(
    `SELECT * FROM sessions WHERE token = $1`,
    [token],
    (error, results) => {
      if (error) {
        return next(error, false)
      }
      if (results.rowCount > 0) {
        return next(null, true)
      }
      return next(null, false)
    },
  )
}

export const deleteSessionModel = (token: string, next: NextFunctionCustom) => {
  pool.query(
    'DELETE FROM sessions WHERE token = $1',
    [token],
    (error, _results) => {
      if (error) {
        return next(error, false)
      }
      return next(null, true)
    },
  )
}

export const createUserModel = async (
  req: Request,
  next: NextFunctionCustom,
): Promise<any> => {
  const { name, email, password, role } = req.body
  const hashPassword = await encryptPassword(password)
  pool.query(
    `INSERT INTO users (name, email, password, role) VALUES ($1, $2, $3, $4) RETURNING id`,
    [name, email, hashPassword, role],
    (error, results) => {
      if (error) {
        return next(error, null)
      }
      return next(null, results.rows[0].id)
    },
  )
}

export const getUsersModel = (req: RequestCustom, next: NextFunctionCustom) => {
  const role = req.user.role
  if (role === 'client') {
    return next({ message: 'You are not authorized to do this' }, null)
  }
  pool.query('SELECT * FROM users ORDER BY id ASC', (error, results) => {
    if (error) {
      return next(error, null)
    }
    return next(null, results.rows)
  })
}

export const getUserByEmailModel = (
  email: string,
  next: NextFunctionCustom,
) => {
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

export const getUserByIdModel = (id: number, next: NextFunctionCustom) => {
  pool.query('SELECT * FROM users WHERE id = $1', [id], (error, results) => {
    if (error) {
      return next(error, null)
    }
    return next(null, results.rows[0])
  })
}
