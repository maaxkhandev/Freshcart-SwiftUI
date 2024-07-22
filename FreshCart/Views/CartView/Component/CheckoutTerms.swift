//
//  CheckoutTerms.swift
//  FreshCart
//
//  Created by Maaz Khan on 18/07/2024.
//

import SwiftUI

struct CheckoutTerms: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack {
                Text("By Placing an order you agree to our")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                Button(action: {}, label: {
                    Text("Terms")
                        .font(.footnote)
                        .foregroundColor(Color(.label))
                        .bold()
                    
                })
            }
            HStack {
                Text("and")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                Button(action: {}, label: {
                    Text("Condition")
                        .font(.footnote)
                        .foregroundColor(Color(.label))
                        .bold()
                    
                })
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 10)
    }
}
