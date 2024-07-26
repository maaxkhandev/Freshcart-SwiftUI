//
//  Product.swift
//  FreshCart
//
//  Created by Maaz Khan on 12/07/2024.
//

import Foundation
enum ProductType: CaseIterable, Identifiable {
    case fruitsAndVegetables
    case cookingOilAndGhee
    case meatAndFish
    case bakeryAndSnacks
    case dairyAndEggs
    case beverages
    
    var id: Self { self }
    
    var displayName: String {
        switch self {
        case .fruitsAndVegetables:
            return "Fruits and Vegetables"
        case .cookingOilAndGhee:
            return "Cooking Oil and Ghee"
        case .meatAndFish:
            return "Meat and Fish"
        case .bakeryAndSnacks:
            return "Bakery and Snacks"
        case .dairyAndEggs:
            return "Dairy and Eggs"
        case .beverages:
            return "Beverages"
        }
    }
}

enum QuantityUnit: String, CaseIterable, Identifiable {
    case kilogram = "kg"
    case gram = "g"
    case liter = "liter"
    case milliliter = "ml"
    case piece = "piece"
    
    var id: String { self.rawValue }
}

struct Nutrition: Identifiable {
    let id = UUID()
    var name: String
    var amount: String
}

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let quantityUnit: String
    let price: Double
    let image: String
    let productType: ProductType
    let description: String
    let nutrition: [Nutrition]
    let review: Double
    let totalNutrition: Int
    var quantity: Int = 0
}

let productList = [
    Product(
        name: "Organic Bananas", quantityUnit: "kg", price: 4.99, image: "banana",
        productType: .fruitsAndVegetables,
        description: "Bananas are rich in potassium and fiber. They can help with digestion and heart health.",
        nutrition: [
            Nutrition(name: "Calories", amount: "105 per banana"),
            Nutrition(name: "Carbohydrates", amount: "27g"),
            Nutrition(name: "Fiber", amount: "3g"),
            Nutrition(name: "Potassium", amount: "422mg")
        ],
        review: 4.5,
        totalNutrition: 100,
        quantity: 1
    ),
    
    Product(name: "Red Apple", quantityUnit: "kg", price: 4.99, image: "apple", productType: .fruitsAndVegetables,
            description: "Apples are nutritious. Apples may be good for weight loss. Apples may be good for your heart as part of a healthful and varied diet.",
            nutrition: [
                Nutrition(name: "Calories", amount: "52 per 100g"),
                Nutrition(name: "Carbohydrates", amount: "14g"),
                Nutrition(name: "Fiber", amount: "2.4g"),
                Nutrition(name: "Vitamin C", amount: "5mg")
            ],
            review: 4.7,
            totalNutrition: 80,
            quantity: 1
           ),
    
    Product(name: "Diet Coke", quantityUnit: "ml", price: 1.99, image: "coke", productType: .beverages,
            description: "Diet Coke is a sugar-free soft drink. It provides a refreshing taste without the calories.",
            nutrition: [
                Nutrition(name: "Calories", amount: "0"),
                Nutrition(name: "Sodium", amount: "40mg"),
                Nutrition(name: "Caffeine", amount: "46mg")
            ],
            review: 4.2,
            totalNutrition: 10,
            quantity: 355
           ),
    
    Product(name: "Sprite Can", quantityUnit: "ml", price: 1.50, image: "sprite", productType: .beverages,
            description: "Sprite is a lemon-lime flavored soft drink with a crisp, clean taste.",
            nutrition: [
                Nutrition(name: "Calories", amount: "140"),
                Nutrition(name: "Carbohydrates", amount: "38g"),
                Nutrition(name: "Sugars", amount: "38g"),
                Nutrition(name: "Sodium", amount: "65mg")
            ],
            review: 4.0,
            totalNutrition: 40,
            quantity: 325
           ),
    
    Product(name: "Apple & Grape Juice", quantityUnit: "L", price: 15.99, image: "apple_grape_juice", productType: .beverages,
            description: "A delicious blend of apple and grape juice, perfect for any time of the day.",
            nutrition: [
                Nutrition(name: "Calories", amount: "120 per serving"),
                Nutrition(name: "Carbohydrates", amount: "29g"),
                Nutrition(name: "Sugars", amount: "24g"),
                Nutrition(name: "Vitamin C", amount: "100% DV")
            ],
            review: 4.3,
            totalNutrition: 200,
            quantity: 2
           ),
    
    Product(name: "Orange Juice", quantityUnit: "L", price: 15.99, image: "orange_juice", productType: .beverages,
            description: "Freshly squeezed orange juice, high in vitamin C and refreshing.",
            nutrition: [
                Nutrition(name: "Calories", amount: "110 per serving"),
                Nutrition(name: "Carbohydrates", amount: "26g"),
                Nutrition(name: "Sugars", amount: "21g"),
                Nutrition(name: "Vitamin C", amount: "120% DV")
            ],
            review: 4.6,
            totalNutrition: 60,
            quantity: 2
           ),
    
    Product(name: "Coca Cola Can", quantityUnit: "ml", price: 4.99, image: "cocacola", productType: .beverages,
            description: "Classic Coca Cola with a unique taste enjoyed worldwide.",
            nutrition: [
                Nutrition(name: "Calories", amount: "140"),
                Nutrition(name: "Carbohydrates", amount: "39g"),
                Nutrition(name: "Sugars", amount: "39g"),
                Nutrition(name: "Sodium", amount: "45mg")
            ],
            review: 4.5,
            totalNutrition: 120,
            quantity: 355
           ),
    
    Product(name: "Pepsi Can", quantityUnit: "ml", price: 4.99, image: "pepsi", productType: .beverages,
            description: "Pepsi is a popular cola-flavored soft drink with a bold taste.",
            nutrition: [
                Nutrition(name: "Calories", amount: "150"),
                Nutrition(name: "Carbohydrates", amount: "41g"),
                Nutrition(name: "Sugars", amount: "41g"),
                Nutrition(name: "Sodium", amount: "30mg")
            ],
            review: 4.4,
            totalNutrition: 90,
            quantity: 330
           ),
    
    Product(name: "Egg Chicken Red", quantityUnit: "pcs", price: 1.99, image: "egg_red", productType: .dairyAndEggs,
            description: "Fresh red chicken eggs, perfect for a nutritious breakfast.",
            nutrition: [
                Nutrition(name: "Calories", amount: "70 per egg"),
                Nutrition(name: "Protein", amount: "6g"),
                Nutrition(name: "Fat", amount: "5g"),
                Nutrition(name: "Cholesterol", amount: "186mg")
            ],
            review: 4.2,
            totalNutrition: 40,
            quantity: 4
           ),
    
    Product(name: "Egg Chicken White", quantityUnit: "pcs", price: 1.50, image: "egg_white", productType: .dairyAndEggs,
            description: "Fresh white chicken eggs, high in protein and versatile for many dishes.",
            nutrition: [
                Nutrition(name: "Calories", amount: "70 per egg"),
                Nutrition(name: "Protein", amount: "6g"),
                Nutrition(name: "Fat", amount: "5g"),
                Nutrition(name: "Cholesterol", amount: "186mg")
            ],
            review: 4.3,
            totalNutrition: 40,
            quantity: 12
           ),
    
    Product(name: "Egg Pasta", quantityUnit: "g", price: 15.99, image: "egg_pasta", productType: .bakeryAndSnacks,
            description: "Delicious egg pasta, perfect for various pasta dishes.",
            nutrition: [
                Nutrition(name: "Calories", amount: "200 per serving"),
                Nutrition(name: "Carbohydrates", amount: "42g"),
                Nutrition(name: "Protein", amount: "7g"),
                Nutrition(name: "Fat", amount: "1g")
            ],
            review: 4.5,
            totalNutrition: 70,
            quantity: 500
           ),
    
    Product(name: "Egg Noodles", quantityUnit: "g", price: 15.99, image: "egg_noodles", productType: .bakeryAndSnacks,
            description: "Tasty egg noodles, ideal for soups and stir-fries.",
            nutrition: [
                Nutrition(name: "Calories", amount: "210 per serving"),
                Nutrition(name: "Carbohydrates", amount: "42g"),
                Nutrition(name: "Protein", amount: "8g"),
                Nutrition(name: "Fat", amount: "2g")
            ],
            review: 4.4,
            totalNutrition: 50,
            quantity: 500
           ),
    
    Product(name: "Mayonnaise Eggless", quantityUnit: "g", price: 15.99, image: "myonaise", productType: .bakeryAndSnacks,
            description: "Creamy eggless mayonnaise, great for sandwiches and salads.",
            nutrition: [
                Nutrition(name: "Calories", amount: "100 per serving"),
                Nutrition(name: "Fat", amount: "11g"),
                Nutrition(name: "Sodium", amount: "90mg"),
                Nutrition(name: "Carbohydrates", amount: "1g")
            ],
            review: 4.1,
            totalNutrition: 10,
            quantity: 250
           ),
    
    Product(name: "Beef Bone", quantityUnit: "kg", price: 10.34, image: "beef_meat", productType: .meatAndFish,
            description: "Beef bones, perfect for making rich and flavorful broths.",
            nutrition: [
                Nutrition(name: "Calories", amount: "150 per 100g"),
                Nutrition(name: "Protein", amount: "22g"),
                Nutrition(name: "Fat", amount: "7g"),
                Nutrition(name: "Iron", amount: "2mg")
            ],
            review: 4.6,
            totalNutrition: 100,
            quantity: 1
           ),
    
    Product(name: "Broiler Chicken", quantityUnit: "kg", price: 4.99, image: "chicken", productType: .meatAndFish,
            description: "Fresh broiler chicken, versatile for many recipes.",
            nutrition: [
                Nutrition(name: "Calories", amount: "239 per 100g"),
                Nutrition(name: "Protein", amount: "27g"),
                Nutrition(name: "Fat", amount: "14g"),
                Nutrition(name: "Cholesterol", amount: "88mg")
            ],
            review: 4.5,
            totalNutrition: 40,
            quantity: 1
           ),
    
    Product(name: "Bell Pepper Red", quantityUnit: "kg", price: 4.99, image: "pepper", productType: .fruitsAndVegetables,
            description: "Fresh red bell peppers, high in vitamin C and antioxidants.",
            nutrition: [
                Nutrition(name: "Calories", amount: "31 per 100g"),
                Nutrition(name: "Carbohydrates", amount: "6g"),
                Nutrition(name: "Fiber", amount: "2g"),
                Nutrition(name: "Vitamin C", amount: "127mg")
            ],
            review: 4.4,
            totalNutrition: 50,
            quantity: 1
           ),
    
    Product(name: "Ginger", quantityUnit: "g", price: 2.99, image: "ginger", productType: .fruitsAndVegetables,
            description: "Fresh ginger, known for its strong flavor and medicinal properties.",
            nutrition: [
                Nutrition(name: "Calories", amount: "80 per 100g"),
                Nutrition(name: "Carbohydrates", amount: "18g"),
                Nutrition(name: "Fiber", amount: "2g"),
                Nutrition(name: "Vitamin C", amount: "5mg")
            ],
            review: 4.3,
            totalNutrition: 90,
            quantity: 250
           )
]

let exclusiveOffer = [
    Product(
        name: "Organic Bananas", quantityUnit: "pcs", price: 4.99, image: "banana",
        productType: .fruitsAndVegetables,
        description: "Bananas are rich in potassium and fiber. They can help with digestion and heart health.",
        nutrition: [
            Nutrition(name: "Calories", amount: "105 per banana"),
            Nutrition(name: "Carbohydrates", amount: "27g"),
            Nutrition(name: "Fiber", amount: "3g"),
            Nutrition(name: "Potassium", amount: "422mg")
        ],
        review: 4.5,
        totalNutrition: 60,
        quantity: 1
    ),
    
    Product(name: "Egg Chicken Red", quantityUnit: "pcs", price: 1.99, image: "egg_red", productType: .dairyAndEggs,
            description: "Fresh red chicken eggs, perfect for a nutritious breakfast.",
            nutrition: [
                Nutrition(name: "Calories", amount: "70 per egg"),
                Nutrition(name: "Protein", amount: "6g"),
                Nutrition(name: "Fat", amount: "5g"),
                Nutrition(name: "Cholesterol", amount: "186mg")
            ],
            review: 4.2,
            totalNutrition: 30,
            quantity: 4
           ),
    
    Product(name: "Beef Bone", quantityUnit: "kg", price: 10.34, image: "beef_meat", productType: .meatAndFish,
            description: "Beef bones, perfect for making rich and flavorful broths.",
            nutrition: [
                Nutrition(name: "Calories", amount: "150 per 100g"),
                Nutrition(name: "Protein", amount: "22g"),
                Nutrition(name: "Fat", amount: "7g"),
                Nutrition(name: "Iron", amount: "2mg")
            ],
            review: 4.6,
            totalNutrition: 20,
            quantity: 1
           )
]

let bestSelling = [
    Product(name: "Red Apple", quantityUnit: "kg", price: 4.99, image: "apple", productType: .fruitsAndVegetables,
            description: "Apples are nutritious. Apples may be good for weight loss. Apples may be good for your heart as part of a healthful and varied diet.",
            nutrition: [
                Nutrition(name: "Calories", amount: "52 per 100g"),
                Nutrition(name: "Carbohydrates", amount: "14g"),
                Nutrition(name: "Fiber", amount: "2.4g"),
                Nutrition(name: "Vitamin C", amount: "5mg")
            ],
            review: 4.7,
            totalNutrition: 300,
            quantity: 1
           ),
    
    Product(name: "Diet Coke", quantityUnit: "ml", price: 1.99, image: "coke", productType: .beverages,
            description: "Diet Coke is a sugar-free soft drink. It provides a refreshing taste without the calories.",
            nutrition: [
                Nutrition(name: "Calories", amount: "0"),
                Nutrition(name: "Sodium", amount: "40mg"),
                Nutrition(name: "Caffeine", amount: "46mg")
            ],
            review: 4.2,
            totalNutrition: 30,
            quantity: 355
           ),
    
    Product(name: "Orange Juice", quantityUnit: "L", price: 15.99, image: "orange_juice", productType: .beverages,
            description: "Freshly squeezed orange juice, high in vitamin C and refreshing.",
            nutrition: [
                Nutrition(name: "Calories", amount: "110 per serving"),
                Nutrition(name: "Carbohydrates", amount: "26g"),
                Nutrition(name: "Sugars", amount: "21g"),
                Nutrition(name: "Vitamin C", amount: "120% DV")
            ],
            review: 4.6,
            totalNutrition: 100,
            quantity: 2
           )
]
