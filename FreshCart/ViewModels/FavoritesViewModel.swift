//
//  CartManager.swift
//  FreshCart
//
//  Created by Maaz Khan on 18/07/2024.
//

import Foundation

class FavoritesViewModel: ObservableObject{
    @Published private(set) var favorites: [Product] = []
    
    func addToFavorites (product: Product){
        if favorites.contains(where: {$0.id == product.id}){
            if let existingProductIndex = favorites.firstIndex(where: {$0.id == product.id}){
           
                favorites.remove(at: existingProductIndex)
                
            }
        }else{
            favorites.append(product)
            
        }
    }
    
    func isFavorite(product: Product) -> Bool {
        return favorites.contains(where: { $0.id == product.id })
    }

    
}
