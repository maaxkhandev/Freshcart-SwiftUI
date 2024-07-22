//
//  CustomButton.swift
//  FreshCart
//
//  Created by Maaz Khan on 10/07/2024.
//

import SwiftUI
struct CustomButton: View {
  
    var title: String
    var action: ()-> Void
    
    
   
    var body: some View {
        Button(action: action, label: {
            Text(title)
                .font(.title2)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.accentColor)
                .cornerRadius(10)
        })
    
        
    }
}
