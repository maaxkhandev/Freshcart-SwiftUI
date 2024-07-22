//
//  AccountViewRow.swift
//  FreshCart
//
//  Created by Maaz Khan on 19/07/2024.
//

import SwiftUI

struct AccountViewRow: View {
    var title: String
    var icon: String
    var body: some View {
        VStack {
            HStack{
                Image(icon)
                    .fontWeight(.semibold )
                    .foregroundColor(.black)
                    .padding(.trailing, 15)
                Text(title)
                
                    .fontWeight(.semibold )
                Spacer()
                Image(systemName: "chevron.right")
                
                    .fontWeight(.semibold )
            }
            Divider()
        } .padding(.horizontal, 20)
            .padding(.vertical, 8)
    }
}

