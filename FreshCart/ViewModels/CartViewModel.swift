//
//  CartManager.swift
//  FreshCart
//
//  Created by Maaz Khan on 18/07/2024.

import Foundation

class CartViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var total: Double = 0.0
    
    func addToCart(product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products[index].quantity += 1
            total += product.price
        } else {
            var newProduct = product
            newProduct.quantity = 1
            products.append(newProduct)
            total += newProduct.price
        }
    }
    
    func removeFromCart(product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            if products[index].quantity > 1 {
                products[index].quantity -= 1
                total -= product.price
            } else {
                total -= products[index].price * Double(products[index].quantity)
                products.remove(at: index)
            }
        }
    }
    
    func manageQuantity(product: Product, increase: Bool) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            if increase {
                products[index].quantity += 1
                total += product.price
            } else {
                if products[index].quantity > 1 {
                    products[index].quantity -= 1
                    total -= product.price
                } else {
                    total -= products[index].price * Double(products[index].quantity)
                    products.remove(at: index)
                }
            }
        }
    }
}
