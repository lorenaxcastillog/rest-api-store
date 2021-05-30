"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const products_controller_1 = require("../controllers/products.controller");
const router = express_1.Router();
/**
 * @swagger
 * /api/products:
 *  post:
 *    tags: [Manager]
 *    description: Create product
 *    parameters:
 *      - in: header
 *        name: Authorization
 *        required: true
 *        schema:
 *          $ref: '#definitions/Authorization'
 *      - in: body
 *        name: product
 *        required: true
 *        schema:
 *          $ref: '#/definitions/CreateProduct'
 *    responses:
 *      200:
 *        description: Success
 *        examples:
 *          application/json:
 *            {"message": "New product added with ID: 36"}
 *      400:
 *        description: Error creating order
 *        examples:
 *          application/json:
 *            {message: You are not authorized to do this}
 */
router.post('/', products_controller_1.createProduct);
/**
 * @swagger
 * /api/products/{id}:
 *  put:
 *    tags: [Manager]
 *    description: Update product
 *    parameters:
 *      - in: path
 *        name: id
 *        required: true
 *        schema:
 *          type: integer
 *        example: 1
 *      - in: header
 *        name: Authorization
 *        required: true
 *        schema:
 *          $ref: '#definitions/Authorization'
 *      - in: body
 *        name: product
 *        required: true
 *        schema:
 *          $ref: '#/definitions/CreateProduct'
 *    responses:
 *      200:
 *        description: Success
 *        examples:
 *          application/json:
 *            {"message": "Product modified with ID: 1"}
 *      400:
 *        description: Error creating order
 *        examples:
 *          application/json:
 *            {message: You are not authorized to do this}
 */
router.put('/:id', products_controller_1.updateProduct);
/**
 * @swagger
 * /api/products/{id}:
 *  delete:
 *    tags: [Manager]
 *    description: Delete product
 *    parameters:
 *      - in: path
 *        name: id
 *        required: true
 *        schema:
 *          type: integer
 *        example: 38
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
 *            {"message": "Product deleted with ID: 38"}
 *      400:
 *        description: Error creating order
 *        examples:
 *          application/json:
 *            {message: You are not authorized to do this}
 */
router.delete('/:id', products_controller_1.deleteProduct);
/**
 * @swagger
 * /api/products/likes:
 *  post:
 *    tags: [Client]
 *    description: Like/dislike product
 *    parameters:
 *      - in: header
 *        name: Authorization
 *        required: true
 *        schema:
 *          $ref: '#definitions/Authorization'
 *      - in: body
 *        name: id_product
 *        required: true
 *        schema:
 *          $ref: '#/definitions/LikeProduct'
 *    responses:
 *      200:
 *        description: Success
 *        examples:
 *          application/json:
 *            {"data": {"id_user": 56,"id_product": 1,"likes": true}}
 *      400:
 *        description: Error liking/disliking the product
 *        examples:
 *          application/json:
 *            {message: You are not authorized to do this}
 */
router.post('/likes', products_controller_1.likeProduct);
exports.default = router;
//# sourceMappingURL=products.router.js.map