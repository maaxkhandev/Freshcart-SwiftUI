//
//  CheckoutRow.swift
//  FreshCart
//
//  Created by Maaz Khan on 18/07/2024.
//

import SwiftUI

struct CheckoutRow<Content: View>: View {
    let leading: String
    let trailing: Content
//    var name: String
    var body: some View {
        VStack{
            HStack{
                Text(leading)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                Spacer()
                Group{
                    trailing
                    Image(systemName: "chevron.right")
                }
                .fontWeight(.semibold)
                
            }
            .padding(.vertical, 14)
            Divider()
        }
        .padding(.horizontal, 20)
    }
}
