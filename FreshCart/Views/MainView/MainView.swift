//
//  MainView.swift
//  FreshCart
//
//  Created by Maaz Khan on 10/07/2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var cartViewModel = CartViewModel()
    @StateObject var favoritesViewModel = FavoritesViewModel()
    @State private var selectedTab = "Shop"
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.black
        
    }
    
    var body: some View {
        TabView (selection: $selectedTab) {
            ShopView(cartViewModel: cartViewModel, favoritesViewModel: favoritesViewModel)
                .tabItem {
                    tabItem(title: "Shop", icon: "shop")
                }
                .tag("shop")
            
            ExploreView(cartViewModel: cartViewModel, favoritesViewModel: favoritesViewModel)
                .tabItem {
                    tabItem(title: "Explore", icon: "explore")
                }
                .tag("explore")
            
            
            CartView(cartViewModel: cartViewModel, favoritesViewModel: favoritesViewModel)
                .tabItem {
                    tabItem(title: "Cart", icon: "cart")
                    
                }
                .tag("cart")
                .badge(cartViewModel.products.count)
            
            FavoritesView(cartViewModel: cartViewModel, favoritesViewModel: favoritesViewModel)
                .tabItem {
                    tabItem(title: "Favorite", icon: "favorite")
                    
                }
                .tag("favorite")
            
            AccountView()
                .tabItem {
                    tabItem(title: "Account", icon: "account")
                    
                }
                .tag("account")
        }
        .navigationBarHidden(true)
        
    }
    
    func tabItem(title: String, icon: String) -> some View {
        VStack {
            Image(icon)
                .resizable()
                .renderingMode(.template)
            Text(title)
        }
    }
    
}

#Preview {
    MainView()
}
