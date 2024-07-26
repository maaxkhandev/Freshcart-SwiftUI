//
//  LoadingView.swift
//  FreshCart
//
//  Created by Maaz Khan on 25/07/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .accent))
        .scaleEffect(2)    }
}

#Preview {
    LoadingView()
}
