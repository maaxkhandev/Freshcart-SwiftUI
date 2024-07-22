//
//  ProductDetailView.swift
//  FreshCart
//
//  Created by Maaz Khan on 12/07/2024.
//

import SwiftUI
struct ProductDetailView: View {

    
    let product: Product
    @ObservedObject var favoritesViewModel: FavoritesViewModel
    
    var body: some View {
        VStack {
            ProductDetailHeader(product: product)
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    HStack {
                        Text( product.name)
                            .font(.title2)
                            .bold()
                        Spacer()
                        Button(action: {
                            favoritesViewModel.addToFavorites(product: product)
                        }, label: {
                            Image(systemName: favoritesViewModel.isFavorite(product: product) ? "heart.fill" :  "heart")
                                .font(.system(size: 25))
                                .foregroundColor( favoritesViewModel.isFavorite(product: product) ? .red : .gray)
                        })
                    }
                    Text("\(product.quantity), Price")
                        .font(.callout)
                        .foregroundColor(Color(.secondaryLabel))
                        .padding(.bottom, 20)
                    
                    ProductDetailQuantitySection(product: product)
                    
                    Divider()
                    Accordian(title: "Product Detail", expandedView: {
                        CustomSubtitle(title: product.description)
                            .lineLimit(nil)
                    }, trailing: {
                        EmptyView()
                    })
                    
                    Divider()
                    ProductDetailNutritionSection(product: product)
                    Divider()
                    
                    ReviewSection(product: product).padding([.top, .bottom], 10)
                    Spacer()
                    
                    CustomButton(title: "Add To Basket") {
                        
                    }.padding(.top)
                }
                .padding(.horizontal, 20)
            }
            
            Spacer()
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.top)
    }
  
}
#Preview {
    ProductDetailView(
        product: productList[1], favoritesViewModel: FavoritesViewModel())
}

