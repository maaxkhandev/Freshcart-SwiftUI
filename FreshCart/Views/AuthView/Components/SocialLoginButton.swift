//
//  SocialLoginButton.swift
//  FreshCart
//
//  Created by Maaz Khan on 10/07/2024.
//

import SwiftUI

struct SocialLoginButton: View {
    var title: String
    var icon: String
    var backgroundColor: Color
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack(spacing: 30) {
                Image(icon)
                
                Text(title)
                
            }
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding(.vertical, 18)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
        }
       
    }
}
