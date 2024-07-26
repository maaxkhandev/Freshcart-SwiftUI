//
//  CustomButton.swift
//  FreshCart
//
//  Created by Maaz Khan on 10/07/2024.
//

import SwiftUI
struct CustomButton: View {
  
    var title: String
    var isLoading: Bool = false
    var isDisable: Bool = false
    var action: () -> Void
    
    
   
    var body: some View {
        Button(action: action, label: {
            
            Group{
                if !isLoading {
                    Text(title)
                        .font(.title2)
                       
                }
                else {
                  ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
                    
                }
            } .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background( Color.accentColor)
                .cornerRadius(10)
           
        })
        .disabled(isDisable || isLoading)
    
        
    }
}
