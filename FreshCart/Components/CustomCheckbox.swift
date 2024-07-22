//
//  CustomCheckbox.swift
//  FreshCart
//
//  Created by Maaz Khan on 19/07/2024.
//

import SwiftUI

struct CheckboxView: View {
    @Binding var isChecked: Bool
    var label: String
    
    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            HStack {

                ZStack{
                    RoundedRectangle(cornerRadius: 3 )
                                   .fill(isChecked ? Color.accentColor : Color.clear)
                                   .frame(width: 20, height: 20)
                                   .overlay(
                                    RoundedRectangle(cornerRadius: 3 )
                                           .stroke(isChecked ? Color.clear : Color.gray, lineWidth: 1)
                                           
                                   )
                    
                    Image("check")
                        .renderingMode(.template)
                        .foregroundColor(isChecked ? .white : Color.clear)
                        .padding(.all, 2)
                }

                Text(label)
                    .foregroundColor(.primary)
            }
          
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    CheckboxView(isChecked: .constant(true), label: "test")
}


