//
//  SigninView.swift
//  FreshCart
//
//  Created by Maaz Khan on 11/07/2024.
//

import SwiftUI

struct SigninView: View {
    @State private var email: String = ""
    @State private var password: String = ""
//    @FocusState private var focusedField: Field?
    
    var body: some View {
        VStack(alignment: .leading) {
           
            Image("carrot1")
                .padding(.top, 20)
                .frame(maxWidth: .infinity, alignment: .center)
            
           
            CustomTitle(title: "Login")
                .padding(.bottom, 6)
            
            CustomSubtitle(title: "Enter your email and password")
                .padding(.bottom, 50)
           
            LabeledTextField(
                inputString: $email,
//                focusedField: _focusedField,
                hint: "Enter your email",
                title: "Email",
                validation: ValidationHelper.isValidEmail,
                errorMessage: "Invalid email format"
            )
            
            LabeledTextField(
                inputString: $password,
//                focusedField: _focusedField,
                hint: "Enter your password",
                title: "Password",
                isPassword: true,
                validation: ValidationHelper.isValidPassword,
                errorMessage: "Password must be at least 8 characters long, contain at least one number, and include at least one capital letter."
            )
           forgotPassword
         
            NavigationLink(destination: MainView()) {
                CustomButton(title: "Log In") {
                   
                }
             
                .padding(.bottom, 10)
                    .allowsHitTesting(false)
            }
           
            
           
            donotHaveAccount
            
        }
        .navigationBarHidden(true)
        .padding(.horizontal, 20)
    }
    
    var forgotPassword: some View{
        Button("Forgot Password?") {
          
        }
        .foregroundColor(.black)
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(.bottom, 30)
    }
    
    var donotHaveAccount: some View{
        HStack {
            Text("Don't have an account?")
                .font(.subheadline)
                .fontWeight(.medium)
            
            NavigationLink(destination: SignUpView()) {
                Button("Sign Up") {
                   
                }
                .font(.subheadline)
                    .allowsHitTesting(false)
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    SigninView()
}
