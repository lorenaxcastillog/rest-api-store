"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const products_controller_1 = require("../controllers/products.controller");
const router = express_1.Router();
router.get('/', products_controller_1.getProducts);
router.post('/', products_controller_1.createProduct);
router.get('/:id', products_controller_1.getProductById);
router.put('/:id', products_controller_1.updateProduct);
router.delete('/:id', products_controller_1.deleteProduct);
router.get('/category/:id', products_controller_1.getProductsByCategory);
exports.default = router;
//# sourceMappingURL=products.router.js.map