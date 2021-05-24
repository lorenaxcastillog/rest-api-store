import express from 'express'
import morgan from 'morgan'
import productsRouter from './routes/products.router'
import userRouter from './routes/user.router'
import { signIn, signUp } from './services/auth'

// Settings
const app = express()
app.set('port', process.env.port || 3000)

// Middleware
app.use(morgan('dev'))
app.use(express.json())

// Routes
app.post('/signup', signUp)
app.post('/signin', signIn)

app.use('/users', userRouter)
app.use('/products', productsRouter)

// Start server
export const start = (): void => {
  try {
    app.listen(app.get('port'), () => {
      console.log(`Server listening on port ${app.get('port')}`)
    })
  } catch (e) {
    console.error(e)
  }
}
