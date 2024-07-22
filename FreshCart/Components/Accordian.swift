//
//  Accordian.swift
//  FreshCart
//
//  Created by Maaz Khan on 12/07/2024.
//

import SwiftUI

struct Accordian<Content: View, Trailing: View>: View {
    @State private var isExpanded = false
    let title: String
    let expandedView: Content
    let trailing: Trailing

    init(title: String, @ViewBuilder expandedView: () -> Content, @ViewBuilder trailing: () -> Trailing) {
        self.title = title
        self.expandedView = expandedView()
        self.trailing = trailing()
    }

    var body: some View {
        VStack (alignment: .leading){
            HStack {
                Text(title)
                    .font(.title3)
                    .fontWeight(.medium)
                Spacer()
                trailing // Trailing view is now handled properly
                Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                    .foregroundColor(.gray)
            }
            .onTapGesture {
                withAnimation {
                    isExpanded.toggle()
                }
            }

            if isExpanded {
                expandedView
                    .transition(.opacity)
            }
        }
    }
}
