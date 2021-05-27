import { Response } from 'express'
import {
  createOrderDetailsModel,
  createOrderModel,
  validateAndGetNewProductStockModel,
} from '../models/orders.model'

export const createOrder = (req: any, res: Response): any => {
  validateAndGetNewProductStockModel(req, (error: any, results: any) => {
    if (error) {
      return res.status(400).json({ message: error.message })
    }
    createOrderModel(
      req.user.id,
      results.total,
      (error: Error, newOrderId: any) => {
        if (error) {
          return res.status(400).send({ message: 'Error creating the order' })
        }
        createOrderDetailsModel(
          newOrderId,
          req.body.products,
          (error: Error, results: any) => {
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
  })
}
