"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const morgan_1 = __importDefault(require("morgan"));
// Settings
const app = express_1.default();
app.set('port', process.env.port || 3000);
// Middleware
app.use(morgan_1.default('dev'));
app.use(express_1.default.json());
// Routes
app.use('/api/tasks', (req, res) => res.send('Hello world'));
// Start server
app.listen(app.get('port'), () => console.log(`Server listening on port ${app.get('port')}`));
//# sourceMappingURL=index.js.map