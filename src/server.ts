import express from 'express'
import morgan from 'morgan'
import { signIn, signOut, signUp } from './controllers/user.controllers'
import productsRouter from './routes/products.router'
import userRouter from './routes/user.router'
import session from 'express-session'
import { config } from './config/dev'
import { protect } from './utils/auth'

const app = express()
app.set('port', process.env.port || 3000)

app.use(morgan('dev'))
app.use(express.json())
app.use(
  session({
    secret: config.secrets.session,
    resave: false,
    saveUninitialized: false,
  }),
)

app.post('/signup', signUp)
app.post('/signin', signIn)

app.use('/api', protect)

app.post('/signout', signOut)

app.use('/api/users', userRouter)
app.use('/api/products', productsRouter)

export const start = (): void => {
  try {
    app.listen(app.get('port'), () => {
      console.log(`Server listening on port ${app.get('port')}`)
    })
  } catch (e) {
    console.error(e)
  }
}
