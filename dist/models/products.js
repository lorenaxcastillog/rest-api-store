"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.deleteProduct = exports.updateProduct = exports.createProduct = exports.getProductByCategory = exports.getProductById = exports.getProducts = void 0;
const db_config_1 = require("../config/db.config");
const getProducts = (req, res) => {
    db_config_1.pool.query('SELECT * FROM products ORDER BY id ASC', (error, results) => {
        if (error) {
            throw error;
        }
        return res.status(200).json(results.rows);
    });
};
exports.getProducts = getProducts;
const getProductById = (req, res) => {
    const id = req.params.id;
    db_config_1.pool.query('SELECT * FROM products WHERE id = $1', [id], (error, results) => {
        if (error) {
            throw error;
        }
        return res.status(200).json(results.rows);
    });
};
exports.getProductById = getProductById;
const getProductByCategory = (req, res) => {
    const category = req.params.category;
    db_config_1.pool.query('SELECT * FROM products WHERE category = $1', [category], (error, results) => {
        if (error) {
            throw error;
        }
        return res.status(200).json(results.rows);
    });
};
exports.getProductByCategory = getProductByCategory;
const createProduct = (req, res) => {
    const { name, code, price, category, image, enabled } = req.body;
    db_config_1.pool.query(`INSERT INTO products (name, code, price, category, image, enabled) VALUES ($1, $2, $3, $4, $5, $6)`, [name, code, price, category !== null && category !== void 0 ? category : null, image !== null && image !== void 0 ? image : null, enabled !== null && enabled !== void 0 ? enabled : true], (error, results) => {
        if (error) {
            throw error;
        }
        res.status(201).json(`New product added`);
    });
};
exports.createProduct = createProduct;
const updateProduct = (req, res) => {
    const id = parseInt(req.params.id);
    const { name, code, price, category, image, enabled } = req.body;
    db_config_1.pool.query(`UPDATE products SET name = $1, code = $2, price = $3, category = $4, image = $5, enabled = $6 WHERE id = $7`, [name, code, price, category, image, enabled, id], (error, _results) => {
        if (error) {
            throw error;
        }
        res.status(200).send(`Product modified with ID: ${id}`);
    });
};
exports.updateProduct = updateProduct;
const deleteProduct = (req, res) => {
    const id = parseInt(req.params.id);
    db_config_1.pool.query('DELETE FROM products WHERE id = $1', [id], (error, _results) => {
        if (error) {
            throw error;
        }
        res.status(200).send(`Product deleted with ID: ${id}`);
    });
};
exports.deleteProduct = deleteProduct;
//# sourceMappingURL=products.js.map