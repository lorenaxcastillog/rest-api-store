/**
 * @swagger
 *  definitions:
 *    Authorization:
 *      type: string
 *      example:
 *          'Bearer token'
 *    UserCredentials:
 *      type: object
 *      required:
 *          - email
 *          - password
 *      properties:
 *          - email:
 *              type: string
 *          - password:
 *              type: string
 *      example:
 *            email: client2@client.com
 *            password: '654321'
 *    User:
 *      type: object
 *      required:
 *          - email
 *          - password
 *      properties:
 *          - name:
 *              type: string
 *          - email:
 *              type: string
 *          - password:
 *              type: string
 *          - role:
 *              type: string
 *      example:
 *            name: client2
 *            email: client2@client.com
 *            password: '654321'
 *            role: client
 *    CreateProduct:
 *            type: object
 *            required:
 *                - name
 *                - price
 *                - image
 *                - enabled
 *                - categoryId
 *                - stock
 *            properties:
 *                - name:
 *                    type: string
 *                - price:
 *                    type: integer
 *                - image:
 *                    type: string
 *                - enabled:
 *                    type: boolean
 *                - categoryId:
 *                    type: integer
 *                - stock:
 *                    type: integer
 *            example:
 *                   {"name": "bubblegum","price": 0.5,"image": null,"enabled": true,"stock": 50}
 *    LikeProduct:
 *            type: object
 *            required:
 *                - id_product
 *                - likes
 *            properties:
 *                - id_product:
 *                    type: integer
 *                - likes:
 *                    type: boolean
 *            example:
 *              {"id_product": 1,"likes": true}
 *    Product:
 *            type: object
 *            required:
 *                - id
 *                - name
 *                - quantity
 *                - price
 *            properties:
 *                - id:
 *                    type: integer
 *                - name:
 *                    type: string
 *                - quantity:
 *                    type: integer
 *                - price:
 *                    type: integer
 *    Products:
 *      type: object
 *      required:
 *          - products
 *      properties:
 *          - products:
 *              schema: '#/definitions/Product'
 *      example:
 *              {products: [{
      id: 1,
      name: "bubblegum",
      quantity: 1,
      price: 0.5
    }],}
 *    Order:
 *            type: object
 *            required:
 *                - id
 *                - id_user
 *                - date
 *                - total
 *            properties:
 *                - id:
 *                    type: integer
 *                - id_user:
 *                    type: integer
 *                - date:
 *                    type: Date
 *                - total:
 *                    type: integer
 */
//# sourceMappingURL=schema-definitions.js.map