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
exports.deleteUserModel = exports.getUserByIdModel = exports.getUserByEmailModel = exports.getUsersModel = exports.createUserModel = void 0;
const db_config_1 = require("../config/db.config");
const auth_1 = require("../utils/auth");
const createUserModel = (req, next) => __awaiter(void 0, void 0, void 0, function* () {
    const { name, email, password } = req.body;
    const hashPassword = yield auth_1.encryptPassword(password);
    db_config_1.pool.query(`INSERT INTO users (name, email, password) VALUES ($1, $2, $3) RETURNING id`, [name, email, hashPassword], (error, results) => {
        if (error) {
            return next(error, null);
        }
        return next(null, results.rows[0].id);
    });
});
exports.createUserModel = createUserModel;
const getUsersModel = (next) => {
    db_config_1.pool.query('SELECT * FROM users ORDER BY id ASC', (error, results) => {
        if (error) {
            return next(error, null);
        }
        return next(null, results.rows);
    });
};
exports.getUsersModel = getUsersModel;
const getUserByEmailModel = (email, next) => {
    db_config_1.pool.query('SELECT * FROM users WHERE email = $1', [email], (error, results) => {
        if (error) {
            return next(error, null);
        }
        return next(null, results.rows[0]);
    });
};
exports.getUserByEmailModel = getUserByEmailModel;
const getUserByIdModel = (id, next) => {
    db_config_1.pool.query('SELECT * FROM users WHERE id = $1', [id], (error, results) => {
        if (error) {
            return next(error, null);
        }
        return next(null, results.rows[0]);
    });
};
exports.getUserByIdModel = getUserByIdModel;
const deleteUserModel = (id, next) => {
    db_config_1.pool.query('DELETE FROM users WHERE id = $1', [id], (error, _results) => {
        if (error) {
            return next(error, null);
        }
        return next(null, id);
    });
};
exports.deleteUserModel = deleteUserModel;
//# sourceMappingURL=user.model.js.map