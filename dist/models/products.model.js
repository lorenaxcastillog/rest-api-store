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
exports.deleteProductModel = exports.likeProductModel = exports.updateProductModel = exports.createProductModel = exports.getProductsByCategoryModel = exports.getProductByIdModel = exports.getProductsModel = exports.getTotalEnabledProductsCountModel = void 0;
const db_config_1 = require("../config/db.config");
const getTotalEnabledProductsCountModel = () => __awaiter(void 0, void 0, void 0, function* () {
    const results = yield db_config_1.pool.query('SELECT COUNT(id) FROM products WHERE enabled = true');
    return parseInt(results.rows[0].count);
});
exports.getTotalEnabledProductsCountModel = getTotalEnabledProductsCountModel;
const getProductsModel = (req, next) => __awaiter(void 0, void 0, void 0, function* () {
    const { offset, limit } = req.body;
    db_config_1.pool.query('SELECT * FROM products ORDER BY id ASC OFFSET $1 LIMIT $2', [offset !== null && offset !== void 0 ? offset : 0, limit !== null && limit !== void 0 ? limit : 10], (error, results) => {
        if (error) {
            return next(error, null);
        }
        return next(null, results.rows);
    });
});
exports.getProductsModel = getProductsModel;
const getProductByIdModel = (id, next) => {
    db_config_1.pool.query('SELECT * FROM products WHERE id = $1', [id], (error, results) => {
        if (error) {
            return next(error, null);
        }
        return next(null, results.rows);
    });
};
exports.getProductByIdModel = getProductByIdModel;
const getProductsByCategoryModel = (categoryId, next) => {
    db_config_1.pool.query(`SELECT products.id, products.name, products.price, products.image, products.enabled, products.stock
        FROM products JOIN products_categories 
          ON products.id = products_categories.id_product 
            WHERE products_categories.id_category = $1 AND products.enabled = true`, [categoryId], (error, results) => {
        if (error) {
            return next(error, null);
        }
        return next(null, results.rows);
    });
};
exports.getProductsByCategoryModel = getProductsByCategoryModel;
const createProductModel = (req, next) => {
    const { name, price, categoryId, image, enabled, stock } = req.body;
    db_config_1.pool.query(`INSERT INTO products (name, price, image, enabled, stock) VALUES ($1, $2, $3, $4, $5) RETURNING id`, [name, price, image !== null && image !== void 0 ? image : null, enabled !== null && enabled !== void 0 ? enabled : true, stock], (error, results) => {
        if (error) {
            return next(error, null);
        }
        const productId = results.rows[0].id;
        db_config_1.pool.query(`INSERT INTO products_categories (id_product, id_category) VALUES($1, $2)`, [productId, categoryId], (error, _results) => {
            if (error) {
                return next(error, null);
            }
            return next(null, {
                message: `New product added with ID: ${productId}`,
            });
        });
    });
};
exports.createProductModel = createProductModel;
const updateProductModel = (req, next) => {
    const id = parseInt(req.params.id);
    const { name, price, image, enabled, stock } = req.body;
    exports.getProductByIdModel(id, (error, results) => {
        if (error) {
            return next(error, null);
        }
        if (results.length === 0) {
            return next(new Error(), null);
        }
        db_config_1.pool.query(`UPDATE products SET name = $1, price = $2, image = $3, enabled = $4, stock = $5 WHERE id = $6`, [name, price, image, enabled, stock, id], (error, _results) => {
            if (error) {
                return next(error, null);
            }
            return next(null, { message: `Product modified with ID: ${id}` });
        });
    });
};
exports.updateProductModel = updateProductModel;
const likeProductModel = (req, next) => {
    const id_user = req.user.id;
    const { id_product, likes } = req.body;
    db_config_1.pool.query(`INSERT INTO likes_users_products (id_user, id_product, likes) VALUES ($1, $2, $3) 
      ON CONFLICT (id_user, id_product) DO UPDATE SET id_user = $1, id_product = $2, likes = $3`, [id_user, id_product, likes], (error, results) => {
        if (error) {
            return next(error, null);
        }
        return next(null, {
            data: { id_user, id_product, likes },
        });
    });
};
exports.likeProductModel = likeProductModel;
const deleteProductModel = (id, next) => {
    db_config_1.pool.query('DELETE FROM products_categories WHERE id_product = $1', [id], (error, _results) => {
        if (error) {
            return next(error, null);
        }
        db_config_1.pool.query('DELETE FROM products WHERE id = $1', [id], (error, _results) => {
            if (error) {
                return next(error, null);
            }
            return next(null, { message: `Product deleted with ID: ${id}` });
        });
    });
};
exports.deleteProductModel = deleteProductModel;
//# sourceMappingURL=products.model.js.map