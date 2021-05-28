import { Request } from 'express'
import { QueryResultRow } from 'pg'

export interface ErrorCustom {
  message: string
}

export type NextFunctionCustom = (
  error: Error | ErrorCustom,
  results: QueryResultRow | any,
) => void

export interface User {
  id: number
  role: string
  password?: string
}

export interface RequestCustom extends Request {
  user: User
}
