import { pool } from '../../../jest.setup'

describe('users tests', () => {
  test('users', async () => {
    console.log('in user spec pool', pool.database)
    const result = await pool.query(`SELECT * FROM products;`)
    console.log(result.rows)

    expect(true).toBeTruthy()
  })
})
