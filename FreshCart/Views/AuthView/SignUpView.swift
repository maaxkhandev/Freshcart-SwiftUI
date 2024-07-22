//
//  SigninView.swift
//  FreshCart
//
//  Created by Maaz Khan on 11/07/2024.
//

import SwiftUI

struct SignUpView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
//    @FocusState private var focusedField: Field?
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Image("carrot1")
                .padding(.top, 20)
                .frame(maxWidth: .infinity, alignment: .center)
            
            
            CustomTitle(title: "Sign Up")
                .padding(.bottom, 6)
            
            CustomSubtitle(title: "Enter your Credentials to continue")
                .padding(.bottom, 50)
            
            
            LabeledTextField(
                inputString: $username,
//                focusedField: _focusedField,
                hint: "Enter your username",
                title: "Username",
                validation: ValidationHelper.isValidUsername,
                errorMessage: "Username must be at least 4 characters"
            )
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
            .padding(.bottom, 10)
            
            terms
            
            NavigationLink(destination: MainView()) {
                CustomButton(title: "Sign Up") {
                    
                }
                .padding(.bottom, 10)
                    .allowsHitTesting(false)
            }
           
           
           
            
            alreadyHaveAccount
            
            Spacer()
            
            
            
            
        }
        .navigationBarHidden(true)
        .padding(.horizontal, 20)
    }
    
    var terms: some View{
        VStack(alignment: .leading, spacing: 2) {
            HStack {
                Text("By Continuing you agree to our")
                    .font(.footnote)
                Button(action: {}, label: {
                    Text("Terms of Service")
                        .font(.footnote)
                    
                })
            }
            
            HStack {
                Text("and")
                    .font(.footnote)
                Button(action: {}, label: {
                    Text("Privacy Policy")
                        .font(.footnote)
                    
                })
            }
        }
    }
    
    var alreadyHaveAccount: some View{
        HStack {
            Text("Already have an account?")
                .font(.subheadline)
                .fontWeight(.medium)
            
            NavigationLink(destination: SigninView()) {
                Button("Sign In") {
                    
                }
                .font(.subheadline)
                .allowsHitTesting(false)
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    SignUpView()
}
