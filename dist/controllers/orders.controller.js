"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.createOrder = void 0;
const orders_model_1 = require("../models/orders.model");
const createOrder = (req, res) => {
    orders_model_1.validateAndGetNewProductStockModel(req, (error, results) => {
        if (error) {
            return res.status(400).json({ message: error.message });
        }
        orders_model_1.createOrderModel(req.user.id, results.total, (error, newOrderId) => {
            if (error) {
                return res.status(400).send({ message: 'Error creating the order' });
            }
            orders_model_1.createOrderDetailsModel(newOrderId, req.body.products, (error, results) => {
                if (error) {
                    return res.status(400).json({ message: error.message });
                }
                return res
                    .status(200)
                    .json({ message: `New order added with id: ${newOrderId}` });
            });
        });
    });
};
exports.createOrder = createOrder;
//# sourceMappingURL=orders.controller.js.map