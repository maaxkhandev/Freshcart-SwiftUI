//
//  ProductCategory.swift
//  FreshCart
//
//  Created by Maaz Khan on 12/07/2024.
//
import Foundation
import SwiftUI

struct ProductCategory: Identifiable {
    var id = UUID()
    var image: String
    var categoryName: String
    var category: ProductType
    var backgroundColor: Color
}

let productCategories = [
    ProductCategory(image: "fruits_vegetable", categoryName: "Fresh Fruits & Vegetable", category: .fruitsAndVegetables, backgroundColor: Color(hex: "#53B175")),
    ProductCategory(image: "coocking_oil_ghee", categoryName: "Cooking Oil and Ghee", category: .cookingOilAndGhee, backgroundColor: Color(hex:"#F8A44C")),
    ProductCategory(image: "meat_fish", categoryName: "Meat & Fish", category: .meatAndFish, backgroundColor: Color(hex:"#F7A593")),
    ProductCategory(image: "backery_snacks", categoryName: "Bakery & Snacks", category: .bakeryAndSnacks, backgroundColor: Color(hex:"#D3B0E0")),
    ProductCategory(image: "dairy_eggs", categoryName: "Dairy & Eggs", category: .dairyAndEggs, backgroundColor: Color(hex:"#FDE598")),
    ProductCategory(image: "beverages", categoryName: "Beverages", category: .beverages, backgroundColor: Color(hex:"#B7DFF5"))
]
