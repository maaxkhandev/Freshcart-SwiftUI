//
//  ProductDetailHeader.swift
//  FreshCart
//
//  Created by Maaz Khan on 12/07/2024.
//

import SwiftUI

struct ProductDetailHeader: View {
    @Environment(\.presentationMode) var presentationMode
    var product: Product
    var body: some View {
        ZStack (alignment: .top){
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding(.top, 60)
                .frame(maxWidth: .infinity)
                .cornerRadius(40, corners: [.bottomLeft, .bottomRight])
                .shadow(radius: 15)
                .padding(.all)
                .background(
                    .ultraThinMaterial
                )
            HStack{
                Group{
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                    })
                    
                    Spacer()
                    Image(systemName: "square.and.arrow.up")
                }
                .font(.title2)
                .foregroundColor(.black)
                .bold()
                
            }
            .padding(.horizontal, 20)
            .padding(.top, 60)
        }
        
        .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
    }
}
