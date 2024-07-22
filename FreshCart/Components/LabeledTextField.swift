//
//  LabeledTextField.swift
//  FreshCart
//
//  Created by Maaz Khan on 11/07/2024.
//

import SwiftUI

struct LabeledTextField: View {
    @Binding var inputString: String
    @FocusState var focusedField: Field?
    let hint: String
    let title: String
    var isPassword: Bool = false
    @State private var isSecured: Bool = true
    var validation: (String) -> Bool = { _ in true }
        var errorMessage: String = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            CustomSubtitle(title: title)
                .padding(.bottom, 15)
            
            ZStack (alignment: .trailing) {
                if isPassword {
                    secureField
                } else {
                    regularTextField
                }
                
                validationIcon
                    .padding(.trailing, isPassword ? 45 : 15)
            }
            
            if !inputString.isEmpty && !validation(inputString) {
                errorMessageView
                   
            }
        }
        .padding(.vertical, 8)
    }
    
    private var secureField: some View {
        ZStack(alignment: .trailing) {
            Group {
                if isSecured {
                    SecureField(hint, text: $inputString)
                } else {
                    TextField(hint, text: $inputString)
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(.systemGray4), lineWidth: 1)
            )
            .frame(height: 40)
            .focused($focusedField, equals: .inputString)
            
            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray)
                    .padding(.trailing, 10)
            }
        }
    }
    
    private var regularTextField: some View {
        TextField(hint, text: $inputString)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(.systemGray4), lineWidth: 1)
            )
            .frame(height: 40)
            .focused($focusedField, equals: .inputString)
    }
    
    private var validationIcon: some View {
        Group {
            if !inputString.isEmpty {
                if validation(inputString) {
                    Image(systemName: "checkmark")
                        .foregroundColor(.green)
                } else {
                    Image(systemName: "xmark")
                        .foregroundColor(.red)
                }
            }
        }
    }
    
    private var errorMessageView: some View {
        Text(errorMessage)
            .foregroundColor(.red)
            .font(.caption)
            .padding(.top, 10)
    }
}
