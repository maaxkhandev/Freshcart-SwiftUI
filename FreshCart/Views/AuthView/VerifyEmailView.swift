//
//  VerifyEmailScreen.swift
//  FreshCart
//
//  Created by Maaz Khan on 25/07/2024.
//
import SwiftUI

struct VerifyEmailView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @State private var timer: Timer?
    
    var body: some View {
        VStack {
            Text("Please verify your email address")
                .font(.title)
                .padding()
            
            Text("A verification email has been sent to \(authViewModel.email). Please check your email and follow the instructions to verify your account.")
                .padding()
            
            Button(action: {
                Task {
                    await authViewModel.resendEmailVerification()
                }
            }) {
                Text("Resend Verification Email")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
            
            Button(action: {
                Task {
                    let isVerified = await authViewModel.checkEmailVerificationStatus()
                    if isVerified {
                        authViewModel.authenticationState = .authenticated
                    }
                }
            }) {
                Text("I have verified my email")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
        .onAppear {
            startVerificationCheck()
        }
        .onDisappear {
            stopVerificationCheck()
        }
    }
    
    private func startVerificationCheck() {
        timer = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: true) { _ in
            Task {
                let isVerified = await authViewModel.checkEmailVerificationStatus()
                if isVerified {
                    authViewModel.authenticationState = .authenticated
                    stopVerificationCheck()
                }
            }
        }
    }
    
    private func stopVerificationCheck() {
        timer?.invalidate()
        timer = nil
    }
}
