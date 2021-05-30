import { Router } from 'express'
import { createOrder, getOrders } from '../controllers/orders.controller'

const router = Router()

/**
 * @swagger
 * /api/orders:
 *  post:
 *    tags: [Client]
 *    description: Create order / Buy products
 *    parameters:
 *      - in: header
 *        name: Authorization
 *        required: true
 *        schema:
 *          $ref: '#definitions/Authorization'
 *      - in: body
 *        name: products
 *        required: true
 *        schema:
 *          $ref: '#/definitions/Products'
 *    responses:
 *      200:
 *        description: Success
 *        examples:
 *          application/json:
 *            {message: New order added with id 1}
 *      400:
 *        description: Error creating order
 *        examples:
 *          application/json:
 *            {message: You are not authorized to do this}
 */
router.post('/', createOrder)

/**
 * @swagger
 * /api/orders:
 *  get:
 *    tags: [Manager, Client]
 *    description: Get clients orders if manager, or get your orders if client
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
      "id_user": "2",
      "date": 2021-05-29T00:12:00.695Z,
      "total": 0.5
    }],}
 *      400:
 *        description: Error getting orders
 *        examples:
 *          application/json:
 *            {message: You are not authorized to do this}
 */
router.get('/', getOrders)

export default router
