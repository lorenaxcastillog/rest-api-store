import { Request, Response } from 'express'
import {
  createUserModel,
  getUserByEmailModel,
  getUsersModel,
  deleteUserModel,
} from '../models/user.model'
import { checkPassword, newToken } from '../utils/auth'

export const signUp = async (req: any, res: Response): Promise<any> => {
  if (!req.body.email || !req.body.password) {
    return res.status(400).send({ message: 'Email and password are required' })
  }
  await createUserModel(req, (userId: string) => {
    try {
      const token = newToken(userId)
      req.session.token = token
      return res.status(201).send({ token })
    } catch (err) {
      console.error(err)
      return res.status(400).end()
    }
  })
}

export const signIn = async (req: any, res: Response): Promise<any> => {
  if (!req.body.email || !req.body.password) {
    return res.status(400).send({ message: 'Email and password are required' })
  }
  getUserByEmailModel(req.body.email, async (error: Error, user: any) => {
    if (!user) {
      return res.status(400).send({ message: 'User does not exist' })
    }
    try {
      const match = await checkPassword(req.body.password, user.password)
      if (!match) {
        return res.status(400).send({ message: 'Password does not match' })
      }
      const token = newToken(user)
      req.session.token = token
      return res.status(201).send({ token })
    } catch (err) {
      console.error(err)
      return res.status(400).end()
    }
  })
}

export const signOut = async (req: any, res: Response): Promise<any> => {
  delete req.session.token
}

export const getUserByEmail = (req: Request, res: Response): void => {
  const email = req.body.email
  getUserByEmailModel(email, (error: Error, results: any) => {
    if (error) {
      return res.status(400).send({ message: 'Error getting user' })
    }
    return res.status(200).json({ data: results })
  })
}

export const getUsers = (req: any, res: Response): any => {
  getUsersModel((error: Error, results: any) => {
    if (error) {
      return res.status(400).send({ message: 'Error getting users' })
    }
    return res.status(200).json({ data: results })
  })
}

export const deleteUser = (req: Request, res: Response): any => {
  const id = parseInt(req.params.id)
  deleteUserModel(id, (error: Error, results: any) => {
    if (error) {
      return res.status(400).send({ message: 'Error deleting user' })
    }
    return res.status(200).send({ message: `User deleted with ID: ${results}` })
  })
}