//
//  CustomDropdown.swift
//  FreshCart
//
//  Created by Maaz Khan on 11/07/2024.
//

import SwiftUI

struct CustomDropDown: View {
    var title: String
    @Binding var selectedValue: String
    var values: [String]
    var body: some View {
        VStack (alignment: .leading, spacing: 0){
            Text(title)
                .font(.callout)
                .foregroundColor(Color("GreyColor"))
            Menu {
                ForEach(values, id: \.self) { value in
                    Button(action: {
                        selectedValue = value
                    }) {
                        Text(value)
                    }
                }
            } label: {
                HStack {
                    Text(selectedValue)
                        .font(.title2)
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 10)
                .overlay(
                    Rectangle()
                        .frame(height: 0.5)
                        .foregroundColor(Color("GreyColor")),
                    alignment: .bottom
                )
            }
        }
    }
}

