import { Request, Response } from 'express'
import {
  createProductModel,
  deleteProductModel,
  getProductByCategoryModel,
  getProductByIdModel,
  getProductsModel,
  updateProductModel,
} from '../models/products.model'

export const getProducts = (req: Request, res: Response): any => {
  const result = getProductsModel()
  return res.status(200).json({ data: result })
}

export const getProductById = (req: Request, res: Response): any => {
  const id = req.params.id
  const result = getProductByIdModel(id)
  return res.status(200).json({ data: result })
}

export const getProductByCategory = (req: Request, res: Response): any => {
  const category = req.params.category
  const result = getProductByCategoryModel(category)
  return res.status(200).json({ data: result })
}

export const createProduct = (req: Request, res: Response): any => {
  const result = createProductModel(req)
  return res.status(200).json({ data: result })
}

export const updateProduct = (req: Request, res: Response): any => {
  const result = updateProductModel(req)
  return res.status(200).json({ data: result })
}

export const deleteProduct = (req: Request, res: Response): any => {
  const id = parseInt(req.params.id)
  const result = deleteProductModel(id)
  return res.status(200).json({ data: result })
}
