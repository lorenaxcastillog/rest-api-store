import { Request, Response } from 'express'
import { QueryResultRow } from 'pg'
import { ErrorCustom, RequestCustom, User } from '../../types/customTypes'
import {
  createUserModel,
  getUserByEmailModel,
  getUsersModel,
  createSessionModel,
  deleteSessionModel,
} from '../models/user.model'
import { checkPassword, newToken } from '../utils/auth'

export const signUp = async (req: Request, res: Response): Promise<any> => {
  if (!req.body.email || !req.body.password) {
    return res.status(400).send({ message: 'Email and password are required' })
  }
  await createUserModel(req, (createUserError: Error, userId: number) => {
    if (createUserError) {
      return res.status(400).send({ message: 'Error signing up' })
    }
    try {
      const token = newToken(userId)
      createSessionModel(token, (error: Error, _results: QueryResultRow) => {
        if (error) {
          return res.status(400).send({ message: 'Error signing up' })
        }
        return res.status(200).json({ token })
      })
    } catch (err) {
      console.error(err)
      return res.status(400).end()
    }
  })
}

export const signIn = async (req: Request, res: Response): Promise<any> => {
  if (!req.body.email || !req.body.password) {
    return res.status(400).send({ message: 'Email and password are required' })
  }
  getUserByEmailModel(req.body.email, async (error: Error, user: User) => {
    if (!user) {
      return res.status(400).send({ message: 'User does not exist' })
    }
    try {
      const match = await checkPassword(req.body.password, user.password)
      if (!match) {
        return res.status(400).send({ message: 'Password does not match' })
      }
      const token = newToken(user.id)
      createSessionModel(token, (error: Error, _results: QueryResultRow) => {
        if (error) {
          return res.status(400).send({ message: 'Error signing in' })
        }
        return res.status(200).json({ token })
      })
    } catch (err) {
      console.error(err)
      return res.status(400).end()
    }
  })
}

export const signOut = async (req: Request, res: Response): Promise<any> => {
  const token = req.headers.authorization.split('Bearer ')[1]
  deleteSessionModel(token, (error: Error, _results: QueryResultRow) => {
    if (error) {
      return res.status(400).send({ message: 'Error signing out' })
    }
    return res.status(200).send({ message: 'Signed out' })
  })
}

export const getUserByEmail = (req: Request, res: Response) => {
  const email = req.body.email
  getUserByEmailModel(email, (error: Error, results: QueryResultRow) => {
    if (error) {
      return res.status(400).send({ message: 'Error getting user' })
    }
    return res.status(200).json({ data: results })
  })
}

export const getUsers = (req: RequestCustom, res: Response) => {
  getUsersModel(req, (error: ErrorCustom, results: QueryResultRow) => {
    if (error) {
      return res.status(400).send({ message: error.message })
    }
    return res.status(200).json({ data: results })
  })
}
