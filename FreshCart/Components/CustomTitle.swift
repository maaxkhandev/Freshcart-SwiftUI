//
//  CustomTitle.swift
//  FreshCart
//
//  Created by Maaz Khan on 11/07/2024.
//

import SwiftUI

struct CustomTitle: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.title)
            .fontWeight(.medium)
    }
}
