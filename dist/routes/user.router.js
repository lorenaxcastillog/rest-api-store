"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const user_controller_1 = require("../services/user.controller");
const router = express_1.Router();
router.get('/', user_controller_1.getUsers);
router.get('/:id', user_controller_1.getUserById);
router.post('/', user_controller_1.createUser);
router.delete('/:id', user_controller_1.deleteUser);
exports.default = router;
//# sourceMappingURL=user.router.js.map