//
//  AuthenticationFlowView.swift
//  FreshCart
//
//  Created by Maaz Khan on 23/07/2024.
//

import SwiftUI
import SwiftUI

struct AuthenticationFlowView: View {
    @StateObject private var authViewModel = AuthenticationViewModel()
    
    var body: some View {
        Group {
            switch authViewModel.authenticationState {
            case .unauthenticated, .authenticating:
                AuthenticationView()
                    .environmentObject(authViewModel)
            case .inital:
                LoadingView()
            case .authenticated:
                MainView()
                    .environmentObject(authViewModel)
            case .emailVerification:
                VerifyEmailView()
                    .environmentObject(authViewModel)
            }
        }
    }
}

#Preview {
    AuthenticationFlowView()
        .environmentObject(AuthenticationViewModel())
}
