"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.start = void 0;
const express_1 = __importDefault(require("express"));
const morgan_1 = __importDefault(require("morgan"));
const products_router_1 = __importDefault(require("./routes/products.router"));
const user_router_1 = __importDefault(require("./routes/user.router"));
const auth_1 = require("./services/auth");
// import { connect } from './utils/db'
// import pool from './config/db.config'
// Settings
const app = express_1.default();
app.set('port', process.env.port || 3000);
// Middleware
app.use(morgan_1.default('dev'));
app.use(express_1.default.json());
// Routes
// app.use('/', (req, res) => res.send('Hello world'))
app.post('/signup', auth_1.signUp);
app.post('/signin', auth_1.signIn);
app.use('/users', user_router_1.default);
app.use('/products', products_router_1.default);
// Start server
const start = () => {
    try {
        // await connect()
        app.listen(app.get('port'), () => {
            console.log(`Server listening on port ${app.get('port')}`);
        });
    }
    catch (e) {
        console.error(e);
    }
};
exports.start = start;
//# sourceMappingURL=server.js.map