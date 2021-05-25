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
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.protect = exports.verifyToken = exports.newToken = exports.encryptPassword = exports.checkPassword = void 0;
const jsonwebtoken_1 = __importDefault(require("jsonwebtoken"));
const dev_1 = require("../config/dev");
const bcryptjs_1 = __importDefault(require("bcryptjs"));
const user_model_1 = require("../models/user.model");
const checkPassword = (password, passwordHash) => {
    return new Promise((resolve, reject) => {
        bcryptjs_1.default.compare(password, passwordHash, (err, same) => {
            if (err) {
                return reject(err);
            }
            resolve(same);
        });
    });
};
exports.checkPassword = checkPassword;
const encryptPassword = (password) => {
    return new Promise((resolve, reject) => {
        bcryptjs_1.default.hash(password, 8, (err, hash) => {
            if (err) {
                return reject(err);
            }
            resolve(hash);
        });
    });
};
exports.encryptPassword = encryptPassword;
const newToken = (userId) => {
    return jsonwebtoken_1.default.sign({ id: userId }, dev_1.config.secrets.jwt, {
        expiresIn: dev_1.config.secrets.jwtExp,
    });
};
exports.newToken = newToken;
const verifyToken = (token) => new Promise((resolve, reject) => {
    jsonwebtoken_1.default.verify(token, dev_1.config.secrets.jwt, (err, payload) => {
        if (err)
            return reject(err);
        resolve(payload);
    });
});
exports.verifyToken = verifyToken;
const protect = (req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
    if (!req.headers.authorization) {
        return res.status(401).end();
    }
    const token = req.headers.authorization.split('Bearer ')[1];
    if (!token) {
        return res
            .status(401)
            .json({ message: 'You are not authorized to see this' });
    }
    const payload = yield exports.verifyToken(token);
    user_model_1.getUserByIdModel(payload.id, (error, results) => {
        try {
            req.user = results;
            next();
        }
        catch (err) {
            console.error(err);
            return res
                .status(401)
                .json({ message: 'You are not authorized to see this' });
        }
    });
});
exports.protect = protect;
//# sourceMappingURL=auth.js.map