import { Request, Response } from 'express'

export const signUp = (req: Request, res: Response): any => {
  return res.status(200).json({ message: 'Signed up' })
}

export const signIn = (req: Request, res: Response): any => {
  return res.status(200).json({ message: 'Signed in' })
}
