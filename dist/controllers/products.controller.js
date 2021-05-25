"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.deleteProduct = exports.updateProduct = exports.createProduct = exports.getProductByCategory = exports.getProductById = exports.getProducts = void 0;
const products_model_1 = require("../models/products.model");
const getProducts = (req, res) => {
    const result = products_model_1.getProductsModel();
    return res.status(200).json({ data: result });
};
exports.getProducts = getProducts;
const getProductById = (req, res) => {
    const id = req.params.id;
    const result = products_model_1.getProductByIdModel(id);
    return res.status(200).json({ data: result });
};
exports.getProductById = getProductById;
const getProductByCategory = (req, res) => {
    const category = req.params.category;
    const result = products_model_1.getProductByCategoryModel(category);
    return res.status(200).json({ data: result });
};
exports.getProductByCategory = getProductByCategory;
const createProduct = (req, res) => {
    const result = products_model_1.createProductModel(req);
    return res.status(200).json({ data: result });
};
exports.createProduct = createProduct;
const updateProduct = (req, res) => {
    const result = products_model_1.updateProductModel(req);
    return res.status(200).json({ data: result });
};
exports.updateProduct = updateProduct;
const deleteProduct = (req, res) => {
    const id = parseInt(req.params.id);
    const result = products_model_1.deleteProductModel(id);
    return res.status(200).json({ data: result });
};
exports.deleteProduct = deleteProduct;
//# sourceMappingURL=products.controller.js.map