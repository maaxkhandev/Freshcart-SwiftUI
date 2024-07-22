//
//  SocialSigninView.swift
//  FreshCart
//
//  Created by Maaz Khan on 10/07/2024.
//

import SwiftUI

struct SocialSigninView: View {
    var body: some View {
        
       
           
            VStack {
                Image("signin")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
               
                ScrollView {
                    VStack(alignment: .leading) {
                        
                        CustomTitle(title: "Get your groceries with freshcart")
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.bottom, 20)
                        
                        NavigationLink(destination: InputNumberView()) {
                            VStack (alignment: .leading) {
                                Text("Select Country")
                                    .font(.title3)
                                    .foregroundColor(.black)
                                Divider()
                            }
                        }
                       
                        
                        
                        CustomSubtitle(title: "Or connect with social media")
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        SocialLoginButton(title: "Continue with Google", icon: "google", backgroundColor: Color.googleButton) {
                        }
                        .padding(.bottom, 15)
                        
                        SocialLoginButton(title: "Continue with facebook", icon: "facebook", backgroundColor: Color.facebookbutton) {
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }.edgesIgnoringSafeArea(.top)
            .navigationBarHidden(true)
    
        
    }
}

#Preview {
    SocialSigninView()
}
