//
//  FavoriteCard.swift
//  FreshCart
//
//  Created by Maaz Khan on 17/07/2024.
//

import SwiftUI

struct FavoriteCard: View {
    let product: Product
    var body: some View {
        VStack{
            HStack{
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                
                VStack (alignment:.leading){
                    Text(product.name)
                        .font(.headline)
                        .foregroundColor(.black)
                        .bold()
                    Text("\(product.quantity)\(product.quantityUnit) Price")
                        .font(.callout)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Group{
                    Text("$\(String(format: "%.2f", product.price))")
                    Image(systemName: "chevron.right")
                }
                .font(.title3)
                .foregroundColor(.black)
                .bold()
                
                
                
            }
            Divider()
        }
        .padding(.horizontal, 20)
    }
}
