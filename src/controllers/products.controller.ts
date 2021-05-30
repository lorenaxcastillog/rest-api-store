import { Request, Response } from 'express'
import { QueryResultRow } from 'pg'
import { ErrorCustom, RequestCustom } from '../../types/customTypes'
import {
  createProductModel,
  deleteProductModel,
  getProductsByCategoryModel,
  getProductByIdModel,
  getProductsModel,
  updateProductModel,
  getTotalEnabledProductsCountModel,
  likeProductModel,
} from '../models/products.model'

export const getProducts = async (
  req: Request,
  res: Response,
): Promise<any> => {
  const offset = parseInt(req.query.offset as string) || 0
  const limit = parseInt(req.query.limit as string) || 10
  const total = await getTotalEnabledProductsCountModel()

  await getProductsModel(req, (error: Error, results: QueryResultRow) => {
    if (error) {
      return res.status(400).send({ message: 'Error getting products' })
    }
    return res.status(200).json({
      data: results,
      pageInfo: {
        offset: offset,
        limit: limit,
        total,
      },
    })
  })
}

export const getProductById = (req: Request, res: Response) => {
  const id = parseInt(req.params.id)
  getProductByIdModel(id, (error: Error, results: QueryResultRow) => {
    if (error) {
      return res.status(400).send({ message: 'Error getting product' })
    }
    return res.status(200).json({ data: results })
  })
}

export const getProductsByCategory = (req: Request, res: Response) => {
  const categoryId = parseInt(req.params.id)
  getProductsByCategoryModel(
    categoryId,
    (error: Error, results: QueryResultRow) => {
      if (error) {
        return res
          .status(400)
          .send({ message: 'Error getting products by category' })
      }
      return res.status(200).json({ data: results })
    },
  )
}

export const createProduct = (req: RequestCustom, res: Response) => {
  createProductModel(req, (error: Error, results: QueryResultRow) => {
    if (error) {
      return res.status(400).send({ message: error.message })
    }
    return res.status(200).json(results)
  })
}

export const updateProduct = (req: RequestCustom, res: Response) => {
  updateProductModel(req, (error: ErrorCustom, results: QueryResultRow) => {
    if (error) {
      return res.status(400).send({ message: error.message })
    }
    return res.status(200).json(results)
  })
}

export const likeProduct = (req: RequestCustom, res: Response) => {
  likeProductModel(req, (error: Error, results: QueryResultRow) => {
    if (error) {
      return res
        .status(400)
        .send({ message: 'Error liking/disliking the product' })
    }
    return res.status(200).json(results)
  })
}

export const deleteProduct = (req: RequestCustom, res: Response) => {
  deleteProductModel(req, (error: Error, results: QueryResultRow) => {
    if (error) {
      return res.status(400).send({ message: error.message })
    }
    return res.status(200).json(results)
  })
}
