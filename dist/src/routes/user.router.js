"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const user_controllers_1 = require("../controllers/user.controllers");
const router = express_1.Router();
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
router.get('/', user_controllers_1.getUsers);
exports.default = router;
//# sourceMappingURL=user.router.js.map