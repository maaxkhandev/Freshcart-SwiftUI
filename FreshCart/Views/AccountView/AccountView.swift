//
//  AccountView.swift
//  FreshCart
//
//  Created by Maaz Khan on 11/07/2024.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .leading){
                profileSection
                Divider()
                    .padding(.top, 20)
                    .padding(.bottom, 8)
                
                AccountViewRow(title: "Order", icon: "order")
                AccountViewRow(title: "My Details", icon: "detail")
                AccountViewRow(title: "Delivery Address", icon: "address")
                AccountViewRow(title: "Payment Methods", icon: "payment1")
                AccountViewRow(title: "Promo Code", icon: "promo_code")
                AccountViewRow(title: "Notification", icon: "notification")
                AccountViewRow(title: "Help", icon: "help")
                AccountViewRow(title: "About", icon: "about")
                
                Button(action: {
                    authViewModel.signOut()
                }, label: {
                    HStack{
                        Image("logout")
                        Spacer()
                        Text("Log Out")
                        Spacer()
                    }
                    .font(.title3)
                    
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundColor(.secondary.opacity(0.2))
                    )
                })
                .padding(.bottom, 60)
                .padding([.horizontal, .top], 20)
                
            }
            
            
            
        }
    }
    
   private var profileSection: some View{
        HStack  {
            Image("avatar2")
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipShape(RoundedRectangle(cornerRadius: 30))
            
            VStack (alignment: .leading, spacing: 0){
                HStack {
                    Text(authViewModel.user?.displayName ?? "")
                        .font(.title2)
                        .bold()
                    Image(systemName: "pencil")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.accentColor)
                }
                
                Text(authViewModel.user?.email ?? "")
                    .font(.callout)
                    .tint(Color(.secondaryLabel))
                
            }
            
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    AccountView()
        .environmentObject(AuthenticationViewModel())
}

