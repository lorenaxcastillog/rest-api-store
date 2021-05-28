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
exports.getUsers = exports.getUserByEmail = exports.signOut = exports.signIn = exports.signUp = void 0;
const user_model_1 = require("../models/user.model");
const auth_1 = require("../utils/auth");
const signUp = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    if (!req.body.email || !req.body.password) {
        return res.status(400).send({ message: 'Email and password are required' });
    }
    yield user_model_1.createUserModel(req, (createUserError, userId) => {
        if (createUserError) {
            return res.status(400).send({ message: 'Error signing up' });
        }
        try {
            const token = auth_1.newToken(userId);
            user_model_1.createSessionModel(token, (error, _results) => {
                if (error) {
                    return res.status(400).send({ message: 'Error signing up' });
                }
                return res.status(200).json({ token });
            });
        }
        catch (err) {
            console.error(err);
            return res.status(400).end();
        }
    });
});
exports.signUp = signUp;
const signIn = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    if (!req.body.email || !req.body.password) {
        return res.status(400).send({ message: 'Email and password are required' });
    }
    user_model_1.getUserByEmailModel(req.body.email, (error, user) => __awaiter(void 0, void 0, void 0, function* () {
        if (!user) {
            return res.status(400).send({ message: 'User does not exist' });
        }
        try {
            const match = yield auth_1.checkPassword(req.body.password, user.password);
            if (!match) {
                return res.status(400).send({ message: 'Password does not match' });
            }
            const token = auth_1.newToken(user.id);
            user_model_1.createSessionModel(token, (error, _results) => {
                if (error) {
                    return res.status(400).send({ message: 'Error signing in' });
                }
                return res.status(200).json({ token });
            });
        }
        catch (err) {
            console.error(err);
            return res.status(400).end();
        }
    }));
});
exports.signIn = signIn;
const signOut = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const token = req.headers.authorization.split('Bearer ')[1];
    user_model_1.deleteSessionModel(token, (error, _results) => {
        if (error) {
            return res.status(400).send({ message: 'Error signing out' });
        }
        return res.status(200).send({ message: 'Signed out' });
    });
});
exports.signOut = signOut;
const getUserByEmail = (req, res) => {
    const email = req.body.email;
    user_model_1.getUserByEmailModel(email, (error, results) => {
        if (error) {
            return res.status(400).send({ message: 'Error getting user' });
        }
        return res.status(200).json({ data: results });
    });
};
exports.getUserByEmail = getUserByEmail;
const getUsers = (req, res) => {
    user_model_1.getUsersModel(req, (error, results) => {
        if (error) {
            return res.status(400).send({ message: error.message });
        }
        return res.status(200).json({ data: results });
    });
};
exports.getUsers = getUsers;
//# sourceMappingURL=user.controllers.js.map