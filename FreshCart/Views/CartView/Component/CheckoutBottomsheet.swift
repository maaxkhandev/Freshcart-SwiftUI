//
//  CheckoutBottomsheet.swift
//  FreshCart
//
//  Created by Maaz Khan on 18/07/2024.
//

import SwiftUI

struct CheckoutBottomsheet: View {
    @Binding var isSheetPresented: Bool
    var body: some View {
        NavigationView{
            VStack (alignment: .leading){
                HStack {
                    Text("Checkout")
                        .font(.title2)
                        .bold()
                    Spacer()
                    Button(action: {isSheetPresented.toggle()}, label: {
                        Image(systemName: "multiply")
                            .font(.title2)
                            .foregroundColor(Color(.label))
                    })
                }
                .padding(.horizontal, 20)
                .padding(.top, 30)
                Divider()
                CheckoutRow(leading: "Delivery", trailing:Text("Select Method"))
                CheckoutRow(leading: "Payment", trailing:Image("payment"))
                CheckoutRow(leading: "Promo Code", trailing:Text("Pick discount"))
                CheckoutRow(leading: "Total Cost", trailing:Text("$13.97"))
                CheckoutTerms()
                
                NavigationLink {
                    OrderAcceptedView()
                } label: {
                    CustomButton(title: "Place Order") {
                        
                    }
                    .allowsHitTesting(false)
                    
                    .padding( 20)
                }
                
                
                Spacer()
                
            }
            .presentationDetents([.fraction(0.7)])
            .presentationCornerRadius(25)
        }
    }
    
    
}
