//
//  ShopViewHeader.swift
//  FreshCart
//
//  Created by Maaz Khan on 12/07/2024.
//

import SwiftUI

struct ShopViewHeader: View {
    var body: some View {
        VStack{
            Image("carrot1")
                .resizable()
                .frame(width: 40, height: 40)
                .scaledToFit()
            HStack{
                
                Image("location_icon")
                Text("Kabul, Afghanistan")
            }
        }
    }
}
