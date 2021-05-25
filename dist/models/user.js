"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.deleteUser = exports.createUser = exports.getUser = exports.getUsers = void 0;
const db_config_1 = require("../config/db.config");
const getUsers = (req, res) => {
    db_config_1.pool.query('SELECT * FROM users ORDER BY id ASC', (error, results) => {
        if (error) {
            throw error;
        }
        return res.status(200).json(results.rows);
    });
};
exports.getUsers = getUsers;
const getUser = (email, password) => {
    db_config_1.pool.query('SELECT * FROM users WHERE email = $1, password = $2', [email, password], (error, results) => {
        if (error) {
            throw error;
        }
        return results.rows[0];
    });
};
exports.getUser = getUser;
const createUser = (req, res) => {
    const { name, email, password } = req.body;
    db_config_1.pool.query(`INSERT INTO users (name, email, password) VALUES ($1, $2, $3) RETURNING id`, [name, email, password], (error, results) => {
        if (error) {
            throw error;
        }
        console.log('created User ======== ', results.rows[0].id); // here is finishing before continuing w signup
        return results.rows[0].id;
        // return res.status(201).json({ data: results.rows })
    });
};
exports.createUser = createUser;
const deleteUser = (req, res) => {
    const id = parseInt(req.params.id);
    db_config_1.pool.query('DELETE FROM users WHERE id = $1', [id], (error, _results) => {
        if (error) {
            throw error;
        }
        res.status(200).send(`User deleted with ID: ${id}`);
    });
};
exports.deleteUser = deleteUser;
//# sourceMappingURL=user.js.map