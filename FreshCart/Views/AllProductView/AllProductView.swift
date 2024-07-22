//
//  AllProductView.swift
//  FreshCart
//
//  Created by Maaz Khan on 19/07/2024.
//

import SwiftUI

struct AllProductView: View {
    @ObservedObject var cartViewModel: CartViewModel
    @ObservedObject var favoritesViewModel: FavoritesViewModel
    @State var showSheet: Bool = false
    @State var searchText: String = ""
    var body: some View {
        VStack{
            HStack {
                CustomSearchBar(text: $searchText, hint: "Search Product", isInsidePadding: false)
                Button(action: {
                    showSheet.toggle()
                }, label: {
                    Image("filter")
                        .frame(width: 30,height: 30)
                })
                
            }
            .padding(.horizontal, 20)
            
            AllProductList(cartViewModel: cartViewModel, favoritesViewModel: favoritesViewModel)
            
            
        }
        .fullScreenCover(isPresented: $showSheet, content: {
            FilterProductbottomsheet(showSheet:  $showSheet)
        })
        
    }
}

#Preview {
    AllProductView(cartViewModel: CartViewModel(), favoritesViewModel: FavoritesViewModel())
}

struct FilterProductbottomsheet: View {
    @Binding var showSheet: Bool
    @State private var selectedCategories: [String: Bool] = [
        "Eggs": true,
        "Noodles & Pasta": false,
        "Chips & Crisps": false,
        "Fast Food": false
    ]
    
    @State private var selectedBrands: [String: Bool] = [
        "Individual Collection": false,
        "Cocola": true,
        "Ifad": false,
        "Kazi Farms": false
    ]
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Button(action: { showSheet.toggle() }, label: {
                    Image(systemName: "multiply")
                        .font(.title2)
                        .foregroundColor(Color(.label))
                })
                Spacer()
                Text("Filters")
                    .font(.title3)
                    .bold()
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            .background(Color.white)
            
            Spacer()
            
            
            ZStack (alignment: .leading){
                Rectangle()
                    .fill(Color(.systemGray6))
                    .frame(height: UIScreen.main.bounds.height * 0.85)
                    .cornerRadius(25, corners: [.topLeft, .topRight])
                
                VStack(alignment: .leading) {
                    Section(header:
                                Text("Categories")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.vertical, 10)
                    ) {
                        ForEach(selectedCategories.keys.sorted(), id: \.self) { item in
                            CheckboxView(isChecked: Binding(
                                get: { selectedCategories[item] ?? false },
                                set: { selectedCategories[item] = $0 }
                            ), label: item)
                        }
                    }
                    
                    Section(header:
                                Text("Brand")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.vertical, 10)
                    ) {
                        ForEach(selectedBrands.keys.sorted(), id: \.self) { item in
                            CheckboxView(isChecked: Binding(
                                get: { selectedBrands[item] ?? false },
                                set: { selectedBrands[item] = $0 }
                            ), label: item)
                        }
                    }
                    Spacer()
                }
                .padding([.horizontal, .vertical], 20)

            }
           
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

