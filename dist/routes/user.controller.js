"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.createUser = exports.getUserById = exports.getUsers = void 0;
const db_config_1 = require("../config/db.config");
const getUsers = (req, res) => {
    db_config_1.pool.query('SELECT * FROM users ORDER BY id ASC', (error, results) => {
        if (error) {
            throw error;
        }
        console.log('res ', results.rows);
        return res.status(200).json(results.rows);
    });
};
exports.getUsers = getUsers;
const getUserById = (req, res) => {
    const id = req.params.id;
    db_config_1.pool.query('SELECT * FROM users WHERE id = $1', [id], (error, results) => {
        if (error) {
            throw error;
        }
        return res.status(200).json(results.rows);
    });
};
exports.getUserById = getUserById;
const createUser = (req, res) => {
    const { name, email, password } = req.body;
    db_config_1.pool.query('INSERT INTO users (name, email, password) VALUES ($1, $2, $3)', [name, email, password], (error, results) => {
        if (error) {
            throw error;
        }
        console.log(results);
        // @ts-expect-error add types later
        res.status(201).json(`User added with ID: ${results.insertId}`);
    });
};
exports.createUser = createUser;
//# sourceMappingURL=user.controller.js.map