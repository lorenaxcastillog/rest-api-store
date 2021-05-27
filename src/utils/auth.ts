import jwt from 'jsonwebtoken'
import { config } from '../config/dev'
import bcrypt from 'bcryptjs'
import { getUserByIdModel, searchSessionModel } from '../models/user.model'

export const checkPassword = (
  password: string,
  passwordHash: string,
): Promise<any> => {
  return new Promise((resolve, reject) => {
    bcrypt.compare(password, passwordHash, (err, same) => {
      if (err) {
        return reject(err)
      }

      resolve(same)
    })
  })
}

export const encryptPassword = (password: string): Promise<any> => {
  return new Promise((resolve, reject) => {
    bcrypt.hash(password, 8, (err: any, hash: any) => {
      if (err) {
        return reject(err)
      }
      resolve(hash)
    })
  })
}

export const newToken = (userId: number) => {
  return jwt.sign({ id: userId }, config.secrets.jwt, {
    expiresIn: config.secrets.jwtExp,
  })
}

export const verifyToken = (token: any) =>
  new Promise((resolve, reject) => {
    jwt.verify(token, config.secrets.jwt, (err: any, payload: any) => {
      if (err) return reject(err)
      resolve(payload.id)
    })
  })

export const protect = async (req: any, res: any, next: any) => {
  if (!req.headers.authorization) {
    return res.status(401).end()
  }
  const token = req.headers.authorization.split('Bearer ')[1]
  if (!token) {
    return res
      .status(401)
      .json({ message: 'You are not authorized to see this' })
  }

  searchSessionModel(token, async (error: Error, results: any) => {
    if (error || !results) {
      return res
        .status(401)
        .json({ message: 'You are not authorized to see this' })
    }
    const payload: any = await verifyToken(token)

    getUserByIdModel(payload.id, (error: Error, results: any) => {
      try {
        req.user = results
        next()
      } catch (err) {
        console.error(err)
        return res
          .status(401)
          .json({ message: 'You are not authorized to see this' })
      }
    })
  })
}
