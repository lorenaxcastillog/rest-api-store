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
exports.signIn = exports.signUp = exports.verifyToken = exports.newToken = void 0;
const jsonwebtoken_1 = __importDefault(require("jsonwebtoken"));
const dev_1 = require("../config/dev");
const user_controller_1 = require("./user.controller");
const newToken = (user) => {
    return jsonwebtoken_1.default.sign({ id: user.id }, dev_1.config.secrets.jwt, {
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
// export const signUp = (req: Request, res: Response): any => {
//   return res.status(200).json({ message: 'Signed up' })
// }
// export const signIn = (req: Request, res: Response): any => {
//   return res.status(200).json({ message: 'Signed in' })
// }
const signUp = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    if (!req.body.email || !req.body.password) {
        return res.status(400).send({ message: 'Email and password are required' });
    }
    try {
        const user = yield user_controller_1.createUser(req, res);
        const token = exports.newToken(user);
        console.log('token = ', token);
        return res.status(201).send({ token });
    }
    catch (err) {
        console.error(err);
        return res.status(400).end();
    }
});
exports.signUp = signUp;
const signIn = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    if (!req.body.email || !req.body.password) {
        return res.status(400).send({ message: 'Email and password are required' });
    }
    const user = yield user_controller_1.getUserById(req, res);
    console.log('user = ', user);
    if (!user) {
        return res.status(401).send({ message: 'User does not exist' });
    }
    try {
        // const match = await user.checkPassword(req.body.password)
        // if (!match) {
        //   return res.status(401).send({ message: 'Password does not match' })
        // }
        const token = exports.newToken(user);
        return res.status(201).send({ token });
    }
    catch (err) {
        console.error(err);
        return res.status(400).end();
    }
});
exports.signIn = signIn;
//# sourceMappingURL=auth.js.map