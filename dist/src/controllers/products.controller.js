"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.deleteProduct = exports.likeProduct = exports.updateProduct = exports.createProduct = exports.getProductsByCategory = exports.getProductById = exports.getProducts = void 0;
const products_model_1 = require("../models/products.model");
const getProducts = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const offset = parseInt(req.query.offset) || 0;
    const limit = parseInt(req.query.limit) || 10;
    const total = yield products_model_1.getTotalEnabledProductsCountModel();
    yield products_model_1.getProductsModel(req, (error, results) => {
        if (error) {
            return res.status(400).send({ message: 'Error getting products' });
        }
        return res.status(200).json({
            data: results,
            pageInfo: {
                offset: offset,
                limit: limit,
                total,
            },
        });
    });
});
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
            return res.status(400).send({ message: error.message });
        }
        return res.status(200).json(results);
    });
};
exports.createProduct = createProduct;
const updateProduct = (req, res) => {
    products_model_1.updateProductModel(req, (error, results) => {
        if (error) {
            return res.status(400).send({ message: error.message });
        }
        return res.status(200).json(results);
    });
};
exports.updateProduct = updateProduct;
const likeProduct = (req, res) => {
    products_model_1.likeProductModel(req, (error, results) => {
        if (error) {
            return res
                .status(400)
                .send({ message: 'Error liking/disliking the product' });
        }
        return res.status(200).json(results);
    });
};
exports.likeProduct = likeProduct;
const deleteProduct = (req, res) => {
    products_model_1.deleteProductModel(req, (error, results) => {
        if (error) {
            return res.status(400).send({ message: error.message });
        }
        return res.status(200).json(results);
    });
};
exports.deleteProduct = deleteProduct;
//# sourceMappingURL=products.controller.js.map