import express from 'express'
import morgan from 'morgan'
import {
  getProductById,
  getProducts,
  getProductsByCategory,
} from './controllers/products.controller'
import { signIn, signOut, signUp } from './controllers/user.controllers'
import ordersRouter from './routes/orders.router'
import productsRouter from './routes/products.router'
import userRouter from './routes/user.router'
import { protect } from './utils/auth'
import swaggerUI from 'swagger-ui-express'
import swaggerJsDoc from 'swagger-jsdoc'

const app = express()
const swaggerOptions = {
  swaggerDefinition: {
    info: {
      title: 'Candy store',
      description: '🍬🍫🍭🍬🍫🍭🍬🍫🍭🍬🍫🍭',
      version: '1.0.0',
    },
  },
  apis: ['./src/routes/*.ts', './src/server.ts', './src/schema-definitions.ts'],
}
const swaggerDocs = swaggerJsDoc(swaggerOptions)

app.set('port', process.env.port || 3000)

app.use(morgan('dev'))
app.use(express.json())

app.use('/api-docs', swaggerUI.serve, swaggerUI.setup(swaggerDocs))

/**
 * @swagger
 * /signup:
 *  post:
 *    tags: [Authentication]
 *    description: Sign up
 *    consumes:
 *      - application/json
 *    parameters:
 *      - in: body
 *        name: new user data
 *        required: true
 *        schema:
 *          $ref: '#/definitions/User'
 *    responses:
 *      200:
 *        description: User signed up successfully
 *        examples:
 *          application/json:
 *            {token: 'token'}
 *      400:
 *        description: Error signing up
 */
app.post('/signup', signUp)

/**
 * @swagger
 * /signin:
 *  post:
 *    tags: [Authentication]
 *    description: Sign in
 *    consumes:
 *      - application/json
 *    parameters:
 *      - in: body
 *        name: credentials
 *        required: true
 *        schema:
 *          $ref: '#/definitions/UserCredentials'
 *    responses:
 *      200:
 *        description: User signed in successfully
 *        examples:
 *          application/json:
 *            {token: 'token'}
 *      400:
 *        description: Error signing in
 */
app.post('/signin', signIn)

/**
 * @swagger
 * /api/products:
 *  get:
 *    tags: [Public]
 *    description: Get products
 *    parameters:
 *      - in: query
 *        name: offset (default 0)
 *        type: integer = 0
 *        example:
 *            "offset": 1
 *      - in: query
 *        name: limit (default 10)
 *        type: integer = 10
 *        example:
 *            "limit": 5
 *    responses:
 *      200:
 *        description: Success
 *        examples:
 *          application/json:
 *            {data: [{
      "id": 2,
      "name": "lollipop",
      "price": 0.5,
      "image": null,
      "enabled": true,
      "stock": 100
    },
  "pageInfo": {
    "offset": 1,
    "limit": 3,
    "total": 8
  }],}
 *      400:
 *        description: Error getting products
 *        examples:
 *          application/json:
 *            {message: You are not authorized to do this}
 */
app.get('/api/products', getProducts)

/**
 * @swagger
 * /api/products/{id}:
 *  get:
 *    tags: [Public]
 *    description: Get product details
 *    consumes:
 *      - application/json
 *    parameters:
 *      - in: path
 *        name: id
 *        required: true
 *        schema:
 *          type: integer
 *        example: 1
 *    responses:
 *      200:
 *        description: Success
 *        examples:
 *          application/json:
 *            {data: [{
      "id": 1,
      "name": "bubblegum",
      "price": 0.5,
      "image": null,
      "enabled": false,
      "stock": 49
    }],}
 *      400:
 *        description: Error getting product
 */
app.get('/api/products/:id', getProductById)

/**
 * @swagger
 * /api/products/category/{id}:
 *  get:
 *    tags: [Public]
 *    description: Get products by category
 *    consumes:
 *      - application/json
 *    parameters:
 *      - in: path
 *        name: id
 *        required: true
 *        schema:
 *          type: integer
 *        example: 5
 *    responses:
 *      200:
 *        description: Success
 *        examples:
 *          application/json:
 *            {data: [{
      "id": 31,
      "name": "M&M",
      "price": 3.5,
      "image": null,
      "enabled": true,
      "stock": 10
    }],}
 *      400:
 *        description: Error getting products by category
 */
app.get('/api/products/category/:id', getProductsByCategory)

app.use('/api', protect)

/**
 * @swagger
 * /signout:
 *  post:
 *    tags: [Authentication]
 *    description: Sign out
 *    parameters:
 *      - in: header
 *        name: Authorization
 *        required: true
 *        schema:
 *          $ref: '#definitions/Authorization'
 *    responses:
 *      200:
 *        description: User signed out successfully
 *        examples:
 *          application/json:
 *            {message: 'Signed out'}
 *      400:
 *        description: Error signing out
 */
app.post('/signout', signOut)

app.use('/api/users', userRouter)
app.use('/api/products', productsRouter)
app.use('/api/orders', ordersRouter)

export const start = (): void => {
  try {
    app.listen(app.get('port'), () => {
      console.log(`Server listening on port ${app.get('port')}`)
    })
  } catch (e) {
    console.error(e)
  }
}
