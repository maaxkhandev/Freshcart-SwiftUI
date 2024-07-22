//
//  CategoryCard.swift
//  FreshCart
//
//  Created by Maaz Khan on 17/07/2024.
//

import SwiftUI

struct CategoryCard: View {
    let category: ProductCategory
    var body: some View {
        VStack {
            Image(category.image)
                .resizable()
                .scaledToFit()
                .frame(width: 80,height: 80)
            Text(category.categoryName)
                .foregroundColor(Color(.label))
                .lineLimit(2)
                .multilineTextAlignment(.center)
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 150)
        .padding()
        .background(category.backgroundColor.opacity(0.4))
        .cornerRadius(15)
        
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(category.backgroundColor.opacity(0.8), lineWidth: 2)
        )
    }
}
