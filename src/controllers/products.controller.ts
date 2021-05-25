import { Request, Response } from 'express'
import {
  createProductModel,
  deleteProductModel,
  getProductsByCategoryModel,
  getProductByIdModel,
  getProductsModel,
  updateProductModel,
} from '../models/products.model'

export const getProducts = (req: Request, res: Response): any => {
  getProductsModel((error: Error, results: any) => {
    if (error) {
      return res.status(400).send({ message: 'Error getting products' })
    }
    return res.status(200).json({ data: results })
  })
}

export const getProductById = (req: Request, res: Response): any => {
  const id = parseInt(req.params.id)
  getProductByIdModel(id, (error: Error, results: any) => {
    if (error) {
      return res.status(400).send({ message: 'Error getting product' })
    }
    return res.status(200).json({ data: results })
  })
}

export const getProductsByCategory = (req: Request, res: Response): any => {
  const categoryId = parseInt(req.params.id)
  getProductsByCategoryModel(categoryId, (error: Error, results: any) => {
    if (error) {
      return res
        .status(400)
        .send({ message: 'Error getting products by category' })
    }
    return res.status(200).json({ data: results })
  })
}

export const createProduct = (req: Request, res: Response): any => {
  createProductModel(req, (error: Error, results: any) => {
    if (error) {
      return res.status(400).send({ message: 'Error creating product' })
    }
    return res.status(200).json({ data: results })
  })
}

export const updateProduct = (req: Request, res: Response): any => {
  updateProductModel(req, (error: Error, results: any) => {
    if (error) {
      return res.status(400).send({ message: 'Error updating product' })
    }
    return res.status(200).json({ data: results })
  })
}

export const deleteProduct = (req: Request, res: Response): any => {
  const id = parseInt(req.params.id)
  deleteProductModel(id, (error: Error, results: any) => {
    if (error) {
      return res.status(400).send({ message: 'Error updating product' })
    }
    return res.status(200).json({ data: results })
  })
}
