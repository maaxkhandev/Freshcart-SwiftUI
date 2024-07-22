//
//  OrderAcceptedView.swift
//  FreshCart
//
//  Created by Maaz Khan on 18/07/2024.
//

import SwiftUI

struct OrderAcceptedView: View {
    var body: some View {
        VStack{
            Spacer()
            Image("order_accepted")
          
            
                Text( "Your Order has been\naccepted")
                      .font(.title2)
                      .bold()
                    
                      .multilineTextAlignment(.center)
                      
                 Text("Your items has been placed and is on it's way to being processed")
                      .font(.callout)
                      .foregroundColor(.secondary)
                      .multilineTextAlignment(.center)
                      .padding(.horizontal, 30)
            
            Spacer()
            CustomButton(title: "Track Order") {
                
            }
            
            NavigationLink {
                MainView()
            } label: {
                
                Text("Back to home")
                    .foregroundColor(Color(.label))
                    .font(.title3)
                    .bold()
                
                .padding(.vertical, 20)
            }

            
            Spacer()
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    OrderAcceptedView()
}
