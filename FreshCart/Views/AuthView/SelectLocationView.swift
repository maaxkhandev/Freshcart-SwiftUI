//
//  SelectLocationView.swift
//  FreshCart
//
//  Created by Maaz Khan on 10/07/2024.
//
import SwiftUI

struct SelectLocationView: View {
    let zones = ["Swat", "Buneer", "Shangla", "Dir"]
    let areas = ["shawar", "matta", "beha", "baidara"]
    @State private var selectedZone: String = "Swat"
    @State private var selectedArea: String = "Matta"
    
    var body: some View {
        VStack {
            Spacer()
            Image("location")
            
            CustomTitle(title: "Select Your Location")
            
            CustomSubtitle(title: "Switch on your location to stay in tune with what's happening in your area", alignment: .center)
            Spacer()
            
            CustomDropDown(title: "Your Zone", selectedValue: $selectedZone, values: zones)
                .padding(.bottom, 20)
            CustomDropDown(title: "Your Area", selectedValue: $selectedArea, values: areas)
                .padding(.bottom, 30)
            
            NavigationLink(destination: AuthenticationView().environmentObject(AuthenticationViewModel())) {
                CustomButton(title: "Submit") {}
                    .allowsHitTesting(false)
            }
            Spacer()
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    SelectLocationView()
        .environmentObject(AuthenticationViewModel())
}
