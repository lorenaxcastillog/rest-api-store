"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.deleteProductModel = exports.updateProductModel = exports.createProductModel = exports.getProductByCategoryModel = exports.getProductByIdModel = exports.getProductsModel = void 0;
const db_config_1 = require("../config/db.config");
const getProductsModel = () => {
    db_config_1.pool.query('SELECT * FROM products ORDER BY id ASC', (error, results) => {
        if (error) {
            throw error;
        }
        return results.rows;
    });
};
exports.getProductsModel = getProductsModel;
const getProductByIdModel = (id) => {
    db_config_1.pool.query('SELECT * FROM products WHERE id = $1', [id], (error, results) => {
        if (error) {
            throw error;
        }
        return results.rows;
    });
};
exports.getProductByIdModel = getProductByIdModel;
const getProductByCategoryModel = (category) => {
    db_config_1.pool.query('SELECT * FROM products WHERE category = $1', [category], (error, results) => {
        if (error) {
            throw error;
        }
        return results.rows;
    });
};
exports.getProductByCategoryModel = getProductByCategoryModel;
const createProductModel = (req) => {
    const { name, code, price, category, image, enabled } = req.body;
    db_config_1.pool.query(`INSERT INTO products (name, code, price, category, image, enabled) VALUES ($1, $2, $3, $4, $5, $6)`, [name, code, price, category !== null && category !== void 0 ? category : null, image !== null && image !== void 0 ? image : null, enabled !== null && enabled !== void 0 ? enabled : true], (error, results) => {
        if (error) {
            throw error;
        }
        return { message: 'New product added' };
    });
};
exports.createProductModel = createProductModel;
const updateProductModel = (req) => {
    const id = parseInt(req.params.id);
    const { name, code, price, category, image, enabled } = req.body;
    db_config_1.pool.query(`UPDATE products SET name = $1, code = $2, price = $3, category = $4, image = $5, enabled = $6 WHERE id = $7`, [name, code, price, category, image, enabled, id], (error, _results) => {
        if (error) {
            throw error;
        }
        return { message: `Product modified with ID: ${id}` };
    });
};
exports.updateProductModel = updateProductModel;
const deleteProductModel = (id) => {
    db_config_1.pool.query('DELETE FROM products WHERE id = $1', [id], (error, _results) => {
        if (error) {
            throw error;
        }
        return { message: `Product deleted with ID: ${id}` };
    });
};
exports.deleteProductModel = deleteProductModel;
//# sourceMappingURL=products.model.js.map