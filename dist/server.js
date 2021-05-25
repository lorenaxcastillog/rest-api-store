"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.start = void 0;
const express_1 = __importDefault(require("express"));
const morgan_1 = __importDefault(require("morgan"));
const user_controllers_1 = require("./controllers/user.controllers");
const products_router_1 = __importDefault(require("./routes/products.router"));
const user_router_1 = __importDefault(require("./routes/user.router"));
const express_session_1 = __importDefault(require("express-session"));
const dev_1 = require("./config/dev");
const auth_1 = require("./utils/auth");
const app = express_1.default();
app.set('port', process.env.port || 3000);
app.use(morgan_1.default('dev'));
app.use(express_1.default.json());
app.use(express_session_1.default({
    secret: dev_1.config.secrets.session,
    resave: false,
    saveUninitialized: false,
}));
app.post('/signup', user_controllers_1.signUp);
app.post('/signin', user_controllers_1.signIn);
app.use('/api', auth_1.protect);
app.post('/signout', user_controllers_1.signOut);
app.use('/api/users', user_router_1.default);
app.use('/api/products', products_router_1.default);
const start = () => {
    try {
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