"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.deleteProduct = exports.updateProduct = exports.createProduct = exports.getProductsByCategory = exports.getProductById = exports.getProducts = void 0;
const products_model_1 = require("../models/products.model");
const getProducts = (req, res) => {
    products_model_1.getProductsModel((error, results) => {
        if (error) {
            return res.status(400).send({ message: 'Error getting products' });
        }
        return res.status(200).json({ data: results });
    });
};
exports.getProducts = getProducts;
const getProductById = (req, res) => {
    const id = parseInt(req.params.id);
    products_model_1.getProductByIdModel(id, (error, results) => {
        if (error) {
            return res.status(400).send({ message: 'Error getting product' });
        }
        return res.status(200).json({ data: results });
    });
};
exports.getProductById = getProductById;
const getProductsByCategory = (req, res) => {
    const categoryId = parseInt(req.params.id);
    products_model_1.getProductsByCategoryModel(categoryId, (error, results) => {
        if (error) {
            return res
                .status(400)
                .send({ message: 'Error getting products by category' });
        }
        return res.status(200).json({ data: results });
    });
};
exports.getProductsByCategory = getProductsByCategory;
const createProduct = (req, res) => {
    products_model_1.createProductModel(req, (error, results) => {
        if (error) {
            return res.status(400).send({ message: 'Error creating product' });
        }
        return res.status(200).json({ data: results });
    });
};
exports.createProduct = createProduct;
const updateProduct = (req, res) => {
    products_model_1.updateProductModel(req, (error, results) => {
        if (error) {
            return res.status(400).send({ message: 'Error updating product' });
        }
        return res.status(200).json({ data: results });
    });
};
exports.updateProduct = updateProduct;
const deleteProduct = (req, res) => {
    const id = parseInt(req.params.id);
    products_model_1.deleteProductModel(id, (error, results) => {
        if (error) {
            return res.status(400).send({ message: 'Error updating product' });
        }
        return res.status(200).json({ data: results });
    });
};
exports.deleteProduct = deleteProduct;
//# sourceMappingURL=products.controller.js.map