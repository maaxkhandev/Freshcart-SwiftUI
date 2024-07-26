//
//  AuthenticationView.swift
//  FreshCart
//
//  Created by Maaz Khan on 23/07/2024.
//


import SwiftUI
import Combine

struct AuthenticationView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel

  var body: some View {
    VStack {
      switch authViewModel.flow {
      case .login:
       SigninView()
          .environmentObject(authViewModel)
      case .signUp:
        SignUpView()
          .environmentObject(authViewModel)
      }
    }
  }
}

struct AuthenticationView_Previews: PreviewProvider {
  static var previews: some View {
    AuthenticationView()
      .environmentObject(AuthenticationViewModel())
  }
}


