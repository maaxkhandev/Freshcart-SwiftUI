//
//  VerificationView.swift
//  FreshCart
//
//  Created by Maaz Khan on 10/07/2024.
//

import SwiftUI

struct VerificationView: View {
    
    @State private var phoneNumber: String = ""
    @FocusState private var focusedField: Field?
    
    var body: some View {
        VStack(alignment: .leading) {
            CustomTitle(title: "Enter your 4-digit code")
                .padding(.bottom, 30)
            
            LabeledTextField( inputString: $phoneNumber, focusedField: _focusedField, hint: "- - - -", title: "Code")
                .onReceive(phoneNumber.publisher.last()) { output in
                    if self.phoneNumber.count > 4 {
                        self.phoneNumber = String(self.phoneNumber.dropLast())
                    }
                }
                .keyboardType(.numberPad)
            
            Spacer()
            
            HStack(alignment: .center) {
                Button(action: {}, label: {
                    Text("Resend Code")
                })
                
                NavigationLink(destination: SelectLocationView()) {
                    RoundNextButton() {}
                    .allowsHitTesting(false)
                }
            }
            .ignoresSafeArea(.keyboard)
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Done") {
                    focusedField = nil
                }
            }
        }
    }
}


#Preview {
    VerificationView()
}
