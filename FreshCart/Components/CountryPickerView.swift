//
//  CountryPickerView.swift
//  FreshCart
//
//  Created by Maaz Khan on 19/07/2024.
//

import SwiftUI


struct CountryPickerView: View {
    @Binding var isPresented: Bool
    @Binding var selectedCountry: Country?
    @State private var searchText = ""
    var countries: [Country]

    var filteredCountries: [Country] {
        if searchText.isEmpty {
            return countries
        } else {
            return countries.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                CustomSearchBar(text: $searchText, hint: "Search Country")
                    .background(
                        .white)
                List(filteredCountries) { country in
                    Button(action: {
                        selectedCountry = country
                        isPresented.toggle()
                    }) {
                        HStack {
                            Text(country.flag)
                            Text(country.dial_code)
                            Spacer()
                            Text(country.name)
                                .font(.title3)
                                .multilineTextAlignment(.leading)
                             
                            
                           Spacer()
                        }
                        .foregroundColor(Color(.label))
                        .listRowBackground(Color.red)
                        
                    }
                }
                .listStyle(.plain)
                
               
            }
            .navigationBarTitle("Select Country", displayMode: .inline)
            .navigationBarItems(trailing: Button("Done") {
                isPresented.toggle()
            })
        }
    }
}
