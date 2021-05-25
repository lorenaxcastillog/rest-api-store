import { Router } from 'express'
import {
  getProductsModel,
  getProductByIdModel,
  getProductByCategoryModel,
  createProductModel,
  updateProductModel,
  deleteProductModel,
} from '../models/products.model'

const router = Router()

router.get('/', getProductsModel)
router.get('/:id', getProductByIdModel)
router.get('/:category', getProductByCategoryModel)
router.post('/', createProductModel)
router.put('/:id', updateProductModel)
router.delete('/:id', deleteProductModel)

export default router
