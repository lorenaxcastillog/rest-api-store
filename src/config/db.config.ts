import express from 'express'
import { Pool } from 'pg'

const app = express()

export const pool = new Pool({
  user: 'lorena',
  password: '',
  database: 'store',
  host: 'localhost',
  port: app.get('port'),
})
