//
//  FavoritesView.swift
//  FreshCart
//
//  Created by Maaz Khan on 11/07/2024.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var cartViewModel: CartViewModel
    @ObservedObject var favoritesViewModel: FavoritesViewModel
    let product = productList[3]
    var body: some View {
        VStack {
            Text("Favorites")
                .font(.title2)
                .bold()
            Divider()
            
            ForEach(favoritesViewModel.favorites) { product in
                NavigationLink {
                    ProductDetailView(product: product, favoritesViewModel: favoritesViewModel)
                } label: {
                    FavoriteCard(product: product)
                }

            }
            Spacer()
            if favoritesViewModel.favorites.count > 0 {
                CustomButton(title: "Add All To Cart") {
                    
                }.padding(.all, 20)
            }
           
            
        }
    }
}

#Preview {
    FavoritesView(cartViewModel: CartViewModel(), favoritesViewModel: FavoritesViewModel())
}
