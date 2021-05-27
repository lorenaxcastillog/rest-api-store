"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const orders_controller_1 = require("../controllers/orders.controller");
const router = express_1.Router();
router.post('/', orders_controller_1.createOrder);
exports.default = router;
//# sourceMappingURL=orders.router.js.map