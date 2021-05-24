import { Router } from 'express'
import {
  getProducts,
  getProductById,
  getProductByCategory,
  createProduct,
  updateProduct,
  deleteProduct,
} from '../services/products.controller'

const router = Router()

router.get('/', getProducts)
router.get('/:id', getProductById)
router.get('/:category', getProductByCategory)
router.post('/', createProduct)
router.put('/:id', updateProduct)
router.delete('/:id', deleteProduct)

export default router
