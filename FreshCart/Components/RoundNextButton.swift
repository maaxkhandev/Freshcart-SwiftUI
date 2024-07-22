//
//  RoundNextButton.swift
//  FreshCart
//
//  Created by Maaz Khan on 10/07/2024.
//

import SwiftUI

struct RoundNextButton: View {
    let action: () -> Void
    var body: some View {
        HStack {
            Spacer()
            Button(action: action) {
                Image(systemName: "chevron.forward")
                    .font(.title)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.accentColor)
                    .clipShape(Circle())
            }
        }
    }
}
