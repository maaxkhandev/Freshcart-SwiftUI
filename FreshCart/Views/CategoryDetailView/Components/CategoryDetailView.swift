//
//  CategoryDetailView.swift
//  FreshCart
//
//  Created by Maaz Khan on 17/07/2024.
//

import SwiftUI

struct CategoryDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var cartViewModel: CartViewModel
    @ObservedObject var favoritesViewModel: FavoritesViewModel
    var title: String
    var products: [Product]
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(Color(.label))
                        .bold()
                        
                })
                Spacer()
                Text(title)
                    .font(.title2)
                    .bold()
                Spacer()
                
            }
            
            ScrollView (showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 15)],spacing: 15, content: {
                               ForEach(products) { product in
                                   ProductCard(cartViewModel:cartViewModel,  product: product)
                               }
                           })
            .padding(.bottom, 80)
            }

        }
        .navigationBarHidden(true)
        .padding(.horizontal, 20)
    }
   
}

#Preview {
    CategoryDetailView( cartViewModel: CartViewModel(),favoritesViewModel: FavoritesViewModel(), title: "Beverages", products: productList)
}
