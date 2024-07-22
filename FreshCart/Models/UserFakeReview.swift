import Foundation

struct UserFakeReview: Identifiable {
    var id = UUID()
    var avatar: String
    var name: String
    var totalReview: Int
    var reviewDescription: String
}

var UserFakeReviewList = [
    UserFakeReview(avatar: "avatar2", name: "John Doe", totalReview: 4, reviewDescription: "Great service, highly recommend!"),
    UserFakeReview(avatar: "avatar1", name: "Jane Smith", totalReview: 5, reviewDescription: "Exceptional experience, will definitely come back."),
    UserFakeReview(avatar: "avatar3", name: "Alice Johnson", totalReview: 3, reviewDescription: "Good overall, but there is room for improvement."),
    UserFakeReview(avatar: "avatar4", name: "Emily Davis", totalReview: 5, reviewDescription: "Fantastic! Couldn't ask for more."),
    UserFakeReview(avatar: "avatar5", name: "Michael Brown", totalReview: 4, reviewDescription: "Very satisfied with the service provided.")
]
