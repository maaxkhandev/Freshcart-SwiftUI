//
//  SigninView.swift
//  FreshCart
//
//  Created by Maaz Khan on 11/07/2024.
//

import SwiftUI

private enum FocusableField: Hashable {
    case userName
    case email
    case password
}

struct SignUpView: View {
   
    @FocusState private var focus: FocusableField?
    
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss
    
   
    private func signUpWithEmailPassword() {
      Task {
        if await authViewModel.signUpWithEmailPassword() == true {
          dismiss()
        }
      }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                Image("carrot1")
                    .padding(.top, 20)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                
                CustomTitle(title: "Sign Up")
                    .padding(.bottom, 6)
                
                CustomSubtitle(title: "Enter your Credentials to continue")
                    .padding(.bottom, 50)
                
                
                LabeledTextField(
                    inputString: $authViewModel.userName,
                    
                    hint: "Enter your username",
                    title: "Username",
                    validation: ValidationHelper.isValidUsername,
                    errorMessage: "Username must be at least 4 characters"
                )
                .focused($focus, equals: .userName)
                .submitLabel(.next)
                .onSubmit {
                  self.focus = .email
                }
                LabeledTextField(
                    inputString: $authViewModel.email,
                    
                    hint: "Enter your email",
                    title: "Email",
                    validation: ValidationHelper.isValidEmail,
                    errorMessage: "Invalid email format"
                )
                .focused($focus, equals: .email)
                .submitLabel(.next)
                .onSubmit {
                  self.focus = .password
                }
                
                LabeledTextField(
                    inputString: $authViewModel.password,
                    
                    hint: "Enter your password",
                    title: "Password",
                    isPassword: true,
                    validation: ValidationHelper.isValidPassword,
                    errorMessage: "Password must be at least 8 characters long, contain at least one number, and include at least one capital letter."
                )
                .focused($focus, equals: .password)
                .submitLabel(.go)
                .onSubmit {
                 signUpWithEmailPassword()
                }
                .padding(.bottom, 10)
                
                terms
                
                if !authViewModel.errorMessage.isEmpty {
                  VStack {
                    Text(authViewModel.errorMessage)
                      .foregroundColor(Color(UIColor.systemRed))
                  }
                  .padding(.vertical, 10)
                }
                    CustomButton(title: "Sign Up", isLoading: authViewModel.authenticationState == .authenticating) {
                        signUpWithEmailPassword()
                    }
                    .padding(.bottom, 10)

                
                
                alreadyHaveAccount
                
                Spacer()
                
                
                
                
            }
            .navigationBarHidden(true)
        .padding(.horizontal, 20)
        }
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
            
//            NavigationLink(destination: SigninView()) {
                Button("Sign In") {
                    authViewModel.switchFlow()
                }
                .font(.subheadline)
               
//            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    SignUpView()
        .environmentObject(AuthenticationViewModel())
}
