//
//  ProductDetailNutritionSection.swift
//  FreshCart
//
//  Created by Maaz Khan on 12/07/2024.
//

import SwiftUI

struct ProductDetailNutritionSection: View {
    let product: Product
    var body: some View {
        Accordian(title: "Nutrition", expandedView: {
            VStack {
                ForEach(product.nutrition) { nutrition in
                    HStack {
                        Text(nutrition.name)
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                        Spacer()
                        Text(nutrition.amount)
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .foregroundColor(Color(.secondaryLabel))
                    }
                }
            }
        }, trailing: {
            Text("\(product.totalNutrition)gr")
                .font(.caption)
                .fontWeight(.thin)
                .padding(.horizontal, 8)
                .padding(.vertical, 2)
                .background(
                    Color.grey.opacity(0.4)
                        .cornerRadius(6)
                )
            
        })
    }
}

#Preview {
    ProductDetailNutritionSection(product: productList[2])
}
