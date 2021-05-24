"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.signIn = exports.signUp = void 0;
const signUp = (req, res) => {
    return res.status(200).json({ message: 'Signed up' });
};
exports.signUp = signUp;
const signIn = (req, res) => {
    return res.status(200).json({ message: 'Signed in' });
};
exports.signIn = signIn;
//# sourceMappingURL=auth.js.map