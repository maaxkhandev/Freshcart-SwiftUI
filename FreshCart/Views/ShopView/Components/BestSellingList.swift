//
//  BestSellingList.swift
//  FreshCart
//
//  Created by Maaz Khan on 12/07/2024.
//

import SwiftUI

struct BestSellingList: View {
    @ObservedObject var cartViewModel: CartViewModel
    @ObservedObject var favoritesViewModel: FavoritesViewModel
    var body: some View {
        VStack (alignment: .leading, spacing: 0){
            HStack{
                Text("Best Selling")
                    .font(.title2)
                    .bold()
                Spacer()
                NavigationLink {
                    AllProductView(cartViewModel: cartViewModel, favoritesViewModel: favoritesViewModel)
                } label: {
                    Button("See all") {
                        
                    }.allowsHitTesting(false)
                }
            }
            .padding(.horizontal, 20)
            ScrollView (.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(bestSelling) { product in
                        NavigationLink(destination: ProductDetailView(product: product, favoritesViewModel: favoritesViewModel)) {
                            ProductCard(cartViewModel: cartViewModel, product: product)
                        }
                    }
                    
                    .containerRelativeFrame(.horizontal, count: 2, spacing:10)
                    
                }
                
                
            }
            .scrollTargetBehavior(.viewAligned)
            .contentMargins(20, for: .scrollContent)
            
        }
    }
}

#Preview {
    BestSellingList(cartViewModel:CartViewModel(),favoritesViewModel: FavoritesViewModel() )
}

