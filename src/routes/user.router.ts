import { Router } from 'express'
import { getUsers } from '../controllers/user.controllers'

const router = Router()

/**
 * @swagger
 * /api/users:
 *  get:
 *    tags: [Manager]
 *    description: Get users
 *    parameters:
 *      - in: header
 *        name: Authorization
 *        required: true
 *        schema:
 *          $ref: '#definitions/Authorization'
 *    responses:
 *      200:
 *        description: Success
 *        examples:
 *          application/json:
 *            {data: [{
      "id": 3,
      "name": "client2",
      "email": "client2@client.com",
      "password": "$2a$08$aIFW0PzT4zgM9RcIb/",
      "role": "client"
    }],}
 *      400:
 *        description: Error getting users
 *        examples:
 *          application/json:
 *            {message: You are not authorized to do this}
 */
router.get('/', getUsers)

export default router
