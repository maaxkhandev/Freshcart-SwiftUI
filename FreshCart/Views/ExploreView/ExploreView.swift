//
//  ExploreView.swift
//  FreshCart
//
//  Created by Maaz Khan on 11/07/2024.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var cartViewModel: CartViewModel
    @ObservedObject var favoritesViewModel: FavoritesViewModel
    @State var  search: String = ""
    var body: some View {
        VStack{
            Text("Find Products")
                .font(.title2)
                .bold()
            CustomSearchBar( text: $search, hint: "Search Category")
            
            
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 15)],spacing: 15, content: {
                    ForEach(productCategories) { category in
                        
                        NavigationLink(destination: CategoryDetailView(cartViewModel: cartViewModel, favoritesViewModel: favoritesViewModel, title: category.categoryName, products: productList.filter({ getCategoryName(for: $0.productType) == category.categoryName }))) {
                            CategoryCard(category: category)
                        }
                        
                        
                        
                        
                    }
                })
                .padding([.horizontal, .top], 20)
                .padding(.bottom, 80)
            }
            
            
        }
    }
    func getCategoryName(for productType: ProductType) -> String? {
        return productCategories.first { $0.category == productType }?.categoryName
    }
}

#Preview {
    ExploreView(cartViewModel: CartViewModel(), favoritesViewModel: FavoritesViewModel())
}



