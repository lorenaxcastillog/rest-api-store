"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.pool = void 0;
const express_1 = __importDefault(require("express"));
const pg_1 = require("pg");
const app = express_1.default();
exports.pool = new pg_1.Pool({
    user: 'lorena',
    password: '',
    database: 'store',
    host: 'localhost',
    port: app.get('port'),
});
//# sourceMappingURL=db.config.js.map