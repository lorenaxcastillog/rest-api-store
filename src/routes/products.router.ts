import { Router } from 'express'
import {
  getProductById,
  getProductsByCategory,
  createProduct,
  updateProduct,
  deleteProduct,
} from '../controllers/products.controller'

const router = Router()

router.post('/', createProduct)
router.get('/:id', getProductById)
router.put('/:id', updateProduct)
router.delete('/:id', deleteProduct)
router.get('/category/:id', getProductsByCategory)

export default router
