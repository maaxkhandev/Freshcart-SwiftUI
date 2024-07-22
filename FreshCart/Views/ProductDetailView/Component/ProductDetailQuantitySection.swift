//
//  ProductDetailQuantitySection.swift
//  FreshCart
//
//  Created by Maaz Khan on 12/07/2024.
//

import SwiftUI

struct ProductDetailQuantitySection: View {
    let product: Product
    @State var quantity: Int = 1
    var body: some View {
        HStack{
            Button(action: {
                if quantity > 1 {
                    quantity -= 1
                }
            }, label: {
                Image(systemName: "minus")
                    .font(.title2)
                    .foregroundColor(quantity > 1 ? Color.black : Color.gray)
                    .bold()
            })
            Text("\(quantity)")
                .font(.title2)
                .frame(width: 50, height: 50)
                .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(style: /*@START_MENU_TOKEN@*/StrokeStyle()/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray)
                
                )
                .padding(.horizontal, 10)
            
            Button(action: {
                quantity += 1
            }, label: {
                Image(systemName: "plus")
                    .font(.title2)
                    .foregroundColor(.accentColor)
                    .bold()
            })
              Spacer()
            Text( "$\(String(format: "%.2f", product.price * Double(quantity)))")
                .font(.title2)
                .bold()
        }
    }
}
