"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const products_model_1 = require("../models/products.model");
const router = express_1.Router();
router.get('/', products_model_1.getProductsModel);
router.get('/:id', products_model_1.getProductByIdModel);
router.get('/:category', products_model_1.getProductByCategoryModel);
router.post('/', products_model_1.createProductModel);
router.put('/:id', products_model_1.updateProductModel);
router.delete('/:id', products_model_1.deleteProductModel);
exports.default = router;
//# sourceMappingURL=products.router.js.map