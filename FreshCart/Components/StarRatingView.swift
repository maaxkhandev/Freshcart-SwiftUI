//
//  StarRatingView.swift
//  FreshCart
//
//  Created by Maaz Khan on 17/07/2024.
//
import SwiftUI
struct StarRatingView: View {
    var totalReview: Int
    let maximumReview: Int
    
    var body: some View {
        HStack {
            ForEach(0..<maximumReview, id: \.self) { index in
                Image(systemName:  "star.fill")
                    .foregroundColor(index < totalReview ? Color.yellow : Color.gray)
            }
            Text("(\(totalReview))")
                .font(.title3)
                .foregroundColor(.secondary)
        }
    }
}

#Preview {
    StarRatingView(totalReview: 4, maximumReview: 5)
}
