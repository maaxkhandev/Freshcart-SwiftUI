//
//  ShopViewBannerCard.swift
//  FreshCart
//
//  Created by Maaz Khan on 12/07/2024.
//

import SwiftUI

struct ShopViewBannerCard: View {
    @State private var currentPage = 0
    var body: some View {
        TabView(selection: $currentPage) {
            ForEach(0..<3) { index in
                ZStack (alignment: .bottom){
                    Image("banner")
                        .resizable()
                        .scaledToFill()
                    
                    ZStack(alignment: .trailing){
                        Color.black.opacity(0.1)
                        VStack {
                            Text("Fresh Vegetables")
                                .font(.custom("Aclonica-Regular", size: 22))
                            
                                .foregroundColor(.black)
                            Text("Get Up To 40% OFF")
                            
                                .foregroundColor(.green)
                        }
                        .padding([.trailing, .top], 15)
                        
                    }
                    
                    HStack {
                        ForEach(0..<3) { index in
                            Capsule()
                                .fill(index == currentPage ? Color.accentColor : Color.gray)
                                .frame(width: index == currentPage ? 30 : 8, height: 8)
                        }
                    }
                    .padding(.bottom, 10)
                    
                }
                .cornerRadius(15)
                
                .shadow(radius: 2)
                .padding(.horizontal, 80)
                
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 110)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

#Preview {
    ShopViewBannerCard()
}
