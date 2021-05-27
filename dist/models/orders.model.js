"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.createOrderModel = exports.createOrderDetailsModel = exports.validateAndGetNewProductStockModel = exports.updateNewProductsStock = void 0;
const db_config_1 = require("../config/db.config");
const updateNewProductsStock = (newProducts, next) => {
    let updateStockQuery = '';
    const requestProductsIds = [];
    for (const product of newProducts) {
        updateStockQuery += `WHEN ${product.id} THEN ${product.stock} `;
        requestProductsIds.push(product.id);
    }
    db_config_1.pool.query(`UPDATE products SET stock = CASE id ${updateStockQuery} ELSE stock END
        WHERE id IN (${requestProductsIds})`, [], (error, results) => {
        if (error) {
            return next(error, null);
        }
        return next(null, { message: `${results.rowCount} products updated` });
    });
};
exports.updateNewProductsStock = updateNewProductsStock;
const validateAndGetNewProductStockModel = (req, next) => {
    const requestProducts = req.body.products;
    const requestProductsIds = [];
    const requestProductsStock = {};
    for (const product of requestProducts) {
        if (product.quantity <= 0) {
            return next({
                message: `You must specify a positive quantity for product: ${product.name}`,
            }, null);
        }
        requestProductsIds.push(product.id);
        requestProductsStock[product.id] = product.quantity;
    }
    db_config_1.pool.query(`SELECT id, name, stock, price FROM products WHERE id IN (${requestProductsIds.toString()})`, [], (error, results) => {
        if (error) {
            return next(error, null);
        }
        const outOfStock = [];
        const newStock = [];
        let total = 0;
        for (const resProduct of results.rows) {
            if (resProduct.stock === 0) {
                outOfStock.push(resProduct.name);
            }
            else {
                if (resProduct.stock < requestProductsStock[resProduct.id]) {
                    return next({
                        message: `The stock is not enough for product: ${resProduct.name}`,
                    }, null);
                }
                total += resProduct.price;
                newStock.push({
                    id: resProduct.id,
                    stock: resProduct.stock - requestProductsStock[resProduct.id],
                });
            }
        }
        if (outOfStock.length !== 0) {
            return next({
                message: `The following products are out of stock: ${outOfStock.toString()}`,
            }, null);
        }
        exports.updateNewProductsStock(newStock, (error, results) => {
            if (error) {
                return next(error, null);
            }
            return next(null, Object.assign(Object.assign({}, results), { total }));
        });
    });
};
exports.validateAndGetNewProductStockModel = validateAndGetNewProductStockModel;
const createOrderDetailsModel = (id_order, products, next) => {
    let values = '';
    for (const i in products) {
        values += ` (${id_order}, ${products[i].id}, ${products[i].quantity}, ${products[i].price})`;
        if (parseInt(i) !== products.length - 1) {
            values += ',';
        }
    }
    db_config_1.pool.query(`INSERT INTO order_details (id_order, id_product, quantity, price) 
      VALUES ${values} RETURNING id`, [], (error, results) => {
        if (error) {
            return next(error, null);
        }
        return next(null, results.rows[0].id);
    });
};
exports.createOrderDetailsModel = createOrderDetailsModel;
const createOrderModel = (id_user, total, next) => {
    const date = new Date();
    db_config_1.pool.query(`INSERT INTO orders (id_user, date, total) VALUES ($1, $2, $3) RETURNING id`, [id_user, date, total], (error, results) => {
        if (error) {
            return next(error, null);
        }
        return next(null, results.rows[0].id);
    });
};
exports.createOrderModel = createOrderModel;
//# sourceMappingURL=orders.model.js.map