import { Response } from 'express'
import {
  createOrderDetailsModel,
  createOrderModel,
  validateAndGetNewProductStockModel,
  getOrdersModel,
} from '../models/orders.model'
import { ErrorCustom, RequestCustom } from '../../types/customTypes'
import { QueryResultBase, QueryResultRow } from 'pg'

export const createOrder = (req: RequestCustom, res: Response) => {
  validateAndGetNewProductStockModel(
    req,
    (error: ErrorCustom, results: QueryResultRow) => {
      if (error) {
        return res.status(400).json({ message: error.message })
      }
      createOrderModel(
        req.user.id,
        results.total,
        (error: Error, newOrderId: number) => {
          if (error) {
            return res.status(400).send({ message: 'Error creating the order' })
          }
          createOrderDetailsModel(
            newOrderId,
            req.body.products,
            (error: ErrorCustom, _results: QueryResultBase) => {
              if (error) {
                return res.status(400).json({ message: error.message })
              }
              return res
                .status(200)
                .json({ message: `New order added with id: ${newOrderId}` })
            },
          )
        },
      )
    },
  )
}

export const getOrders = (req: RequestCustom, res: Response) => {
  getOrdersModel(req, (error: ErrorCustom, results: QueryResultRow) => {
    if (error) {
      return res.status(400).json({ message: error.message })
    }
    return res.status(200).json({ data: results })
  })
}
