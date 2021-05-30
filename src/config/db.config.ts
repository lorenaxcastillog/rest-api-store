import { Pool } from 'pg'
import * as dotenv from 'dotenv'

dotenv.config({ path: '.env' })

export const pool = new Pool({
  database: process.env.DB_NAME,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  host: process.env.DB_HOST,
  port: parseInt(process.env.DB_PORT) || 5432,
})
