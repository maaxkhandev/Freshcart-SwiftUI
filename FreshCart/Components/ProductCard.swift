//
//  ProductCard.swift
//  FreshCart
//
//  Created by Maaz Khan on 12/07/2024.
//

import SwiftUI

struct ProductCard: View {
    @ObservedObject var cartViewModel: CartViewModel
    var product: Product
    
    var body: some View {
        VStack{
            Image(product.image)
//                .resizable()
                .frame(width: 100, height: 100)
//                .aspectRatio(contentMode: )
            Text(product.name)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.headline)
                .foregroundColor(.black)
                .lineLimit(1)
            
            CustomSubtitle(title:"\(product.quantity)\(product.quantityUnit)")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            HStack {
                Text("$\(String(format: "%.2f", product.price * Double(product.quantity)))")
                    .font(.title2)
                    .foregroundColor(.black)
                    .bold()
                Spacer()
                Button(action: {
                    cartViewModel.addToCart(product: product)
                }) {
                    Image(systemName: cartViewModel.products.contains(where: { $0.id == product.id }) ? "minus" : "plus")
                        .frame(width: 35, height: 35)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
            }

            
        }
        
        .padding(.all)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.grey, lineWidth: 0.5)
        )
    }
}

#Preview {
    ProductCard(cartViewModel: CartViewModel(), product: productList[0])
}
