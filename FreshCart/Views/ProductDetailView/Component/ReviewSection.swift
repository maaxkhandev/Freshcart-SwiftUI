//
//  ReviewSection.swift
//  FreshCart
//
//  Created by Maaz Khan on 17/07/2024.
//

import SwiftUI

struct ReviewSection: View {
    @State var userRating: Int = 0
    @State var reviewText: String = ""
    var product: Product
    var body: some View {
        Accordian(title: "Review", expandedView: {
            VStack (alignment: .leading, spacing: 10) {
                ForEach(UserFakeReviewList) { fakeReview in
                    HStack (alignment: .top, spacing: 10) {
                        Image(fakeReview.avatar)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                        
                        VStack (alignment: .leading, spacing: 5) {
                            Text(fakeReview.name)
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            StarRatingView(totalReview: 5, maximumReview: fakeReview.totalReview)
                            Text(fakeReview.reviewDescription)
                                .font(.body)
                                .foregroundColor(.primary)
                        }
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                    }
                    .padding(.horizontal)
                }
                
                RatingView(rating: $userRating, maximumRating: 5).padding(.top, 20)
                TextField("Write a Review", text: $reviewText)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                
                
            }
            .padding(.vertical)
            
        }, trailing: {
            StarRatingView(totalReview: 5, maximumReview: Int(product.review))
            
        })
    }
}

#Preview {
    ReviewSection(userRating: 0, product: productList[2])
}
