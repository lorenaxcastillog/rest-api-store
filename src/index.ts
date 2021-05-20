import express from 'express'
import morgan from 'morgan'

// Settings
const app = express()
app.set('port', process.env.port || 3000)

// Middleware
app.use(morgan('dev'))
app.use(express.json())

// Routes
app.use('/api/tasks', (req, res) => res.send('Hello world'))

// Start server
app.listen(app.get('port'), () =>
  console.log(`Server listening on port ${app.get('port')}`),
)
