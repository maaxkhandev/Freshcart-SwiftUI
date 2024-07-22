//
//  AllProductList.swift
//  FreshCart
//
//  Created by Maaz Khan on 19/07/2024.
//

import SwiftUI

struct AllProductList: View {
    @ObservedObject var cartViewModel: CartViewModel
    @ObservedObject var favoritesViewModel: FavoritesViewModel
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 15)],spacing: 15, content: {
                ForEach(productList) { product in
                    
                    NavigationLink(destination: ProductDetailView(product: product, favoritesViewModel: favoritesViewModel)) {
                        ProductCard(cartViewModel: cartViewModel, product: product)
                    }
                    
                    
                    
                    
                }
            })
            .padding([.horizontal, .top], 20)
            .padding(.bottom, 80)
        }
    }
}
