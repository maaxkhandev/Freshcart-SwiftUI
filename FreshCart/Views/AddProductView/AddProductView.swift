//
//  AddProductView.swift
//  FreshCart
//
//  Created by Maaz Khan on 25/07/2024.
//

import SwiftUI
struct AddProductView: View {
    @State private var productName = ""
    @State private var selectedQuantityUnit: QuantityUnit = .kilogram
    @State private var price = ""
    @State private var imageUrl = ""
    @State private var selectedProductType: ProductType = .fruitsAndVegetables
    @State private var description = ""
    @State private var nutritionList = [Nutrition(name: "", amount: "")]

    @State private var totalNutrition = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Product Details")) {
                    TextField("Product Name", text: $productName)
                    Picker("Quantity Unit", selection: $selectedQuantityUnit) {
                        ForEach(QuantityUnit.allCases) { unit in
                            Text(unit.rawValue).tag(unit)
                        }
                    }
                    TextField("Price", text: $price)
                        .keyboardType(.decimalPad)
                    TextField("Image URL", text: $imageUrl)
                    Picker("Product Type", selection: $selectedProductType) {
                        ForEach(ProductType.allCases) { type in
                            Text(type.displayName).tag(type)
                        }
                    }
                    TextField("Description", text: $description)
                }
                
                Section(header: Text("Nutrition Information")) {
                    ForEach($nutritionList) { $nutrition in
                        HStack {
                            TextField("Name", text: $nutrition.name)
                            TextField("Amount", text: $nutrition.amount)
                        }
                    }
                    Button(action: {
                        nutritionList.append(Nutrition(name: "", amount: ""))
                    }) {
                        Label("Add Nutrition", systemImage: "plus")
                    }
                }
                
                Section(header: Text("Additional Information")) {
                    TextField("Total Nutrition", text: $totalNutrition)
                        .keyboardType(.numberPad)
                }
                
                CustomButton(title: "Add Product") {
                    let newProduct = Product(
                        name: productName,
                        quantityUnit: selectedQuantityUnit.rawValue,
                        price: Double(price) ?? 0.0,
                        image: imageUrl,
                        productType: selectedProductType,
                        description: description,
                        nutrition: nutritionList,
                        review: 0.0,
                        totalNutrition: Int(totalNutrition) ?? 0
                    )
                }
                
              
            }
            .navigationTitle("Add Product")
        }
    }
}

#Preview {
    AddProductView()
}
