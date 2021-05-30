"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.start = void 0;
const express_1 = __importDefault(require("express"));
const morgan_1 = __importDefault(require("morgan"));
const products_controller_1 = require("./controllers/products.controller");
const user_controllers_1 = require("./controllers/user.controllers");
const orders_router_1 = __importDefault(require("./routes/orders.router"));
const products_router_1 = __importDefault(require("./routes/products.router"));
const user_router_1 = __importDefault(require("./routes/user.router"));
const auth_1 = require("./utils/auth");
const swagger_ui_express_1 = __importDefault(require("swagger-ui-express"));
const swagger_jsdoc_1 = __importDefault(require("swagger-jsdoc"));
const app = express_1.default();
const swaggerOptions = {
    swaggerDefinition: {
        info: {
            title: 'Candy store',
            description: '🍬🍫🍭🍬🍫🍭🍬🍫🍭🍬🍫🍭',
            version: '1.0.0',
        },
    },
    apis: ['./src/routes/*.ts', './src/server.ts', './src/schema-definitions.ts'],
};
const swaggerDocs = swagger_jsdoc_1.default(swaggerOptions);
app.set('port', process.env.port || 3000);
app.use(morgan_1.default('dev'));
app.use(express_1.default.json());
app.use('/api-docs', swagger_ui_express_1.default.serve, swagger_ui_express_1.default.setup(swaggerDocs));
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
app.post('/signup', user_controllers_1.signUp);
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
app.post('/signin', user_controllers_1.signIn);
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
app.get('/api/products', products_controller_1.getProducts);
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
app.get('/api/products/:id', products_controller_1.getProductById);
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
app.get('/api/products/category/:id', products_controller_1.getProductsByCategory);
app.use('/api', auth_1.protect);
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
app.post('/signout', user_controllers_1.signOut);
app.use('/api/users', user_router_1.default);
app.use('/api/products', products_router_1.default);
app.use('/api/orders', orders_router_1.default);
const start = () => {
    try {
        app.listen(app.get('port'), () => {
            console.log(`Server listening on port ${app.get('port')}`);
        });
    }
    catch (e) {
        console.error(e);
    }
};
exports.start = start;
//# sourceMappingURL=server.js.map