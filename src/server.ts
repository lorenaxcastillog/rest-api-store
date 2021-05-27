import express from 'express'
import morgan from 'morgan'
import { getProducts } from './controllers/products.controller'
import { signIn, signOut, signUp } from './controllers/user.controllers'
import ordersRouter from './routes/orders.router'
import productsRouter from './routes/products.router'
import userRouter from './routes/user.router'
import { protect } from './utils/auth'

const app = express()
app.set('port', process.env.port || 3000)

app.use(morgan('dev'))
app.use(express.json())

app.post('/signup', signUp)
app.post('/signin', signIn)

app.get('/api/products', getProducts)

app.use('/api', protect)

app.post('/signout', signOut)

app.use('/api/users', userRouter)
app.use('/api/products', productsRouter)
app.use('/api/orders', ordersRouter)

export const start = (): void => {
  try {
    app.listen(app.get('port'), () => {
      console.log(`Server listening on port ${app.get('port')}`)
    })
  } catch (e) {
    console.error(e)
  }
}
