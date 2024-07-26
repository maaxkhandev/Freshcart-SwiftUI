//
//  SigninView.swift
//  FreshCart
//
//  Created by Maaz Khan on 11/07/2024.
//
import SwiftUI

private enum FocusableField: Hashable {
    case email
    case password
}

struct SigninView: View {
   
    @FocusState private var focus: FocusableField?
    
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss
    
    private func signInWithEmailPassword() {
        Task {
            if await authViewModel.signInWithEmailPassword() == true {
                dismiss()
            }
        }
    }
    
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
            .submitLabel(.next)
            .onSubmit {
            signInWithEmailPassword()
            }
            forgotPassword
            
            if !authViewModel.errorMessage.isEmpty {
              VStack {
                Text(authViewModel.errorMessage)
                  .foregroundColor(Color(UIColor.systemRed))
              }
              .padding(.vertical, 10)
            }
            
            CustomButton(title: "Log In", isLoading: authViewModel.authenticationState == .authenticating) {
                signInWithEmailPassword()
            }
            .padding(.bottom, 10)
            
            donotHaveAccount
        }
        .navigationBarHidden(true)
        .padding(.horizontal, 20)
    }
    
    var forgotPassword: some View {
        Button("Forgot Password?") { }
        .foregroundColor(.black)
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(.bottom, 30)
    }
    
    var donotHaveAccount: some View {
        HStack {
            Text("Don't have an account?")
                .font(.subheadline)
                .fontWeight(.medium)
            Button("Sign Up") {
                authViewModel.switchFlow()
            }
            .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    SigninView()
        .environmentObject(AuthenticationViewModel())
}
