//
//  SubtitleGrey.swift
//  FreshCart
//
//  Created by Maaz Khan on 11/07/2024.
//

import SwiftUI

struct CustomSubtitle: View {
    let title: String
    var alignment: TextAlignment = TextAlignment.leading
    var body: some View {
        Text(title)
            .font(.callout)
            .foregroundColor(Color("GreyColor"))
            .multilineTextAlignment(alignment)
    }
}
