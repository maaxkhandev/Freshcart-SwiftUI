import SwiftUI

struct InputNumberView: View {
    private enum Field: Int, CaseIterable {
        case phoneNumber
    }
    
//    @State private var isNextEnabled = false
//    private var bannerData = BannerData(title: "Info", detail: "This is an informational banner.", type: .info)
//        @State private var showBanner = false
    @State private var phoneNumber: String = ""
    @FocusState private var focusedField: Field?
    @State private var isCountryPickerPresented = false
    @State private var selectedCountry: Country?
    @State private var countries: [Country] = []

    init() {
        _countries = State(initialValue: loadJson("CountriesInfo"))
        print("Countries in init: \(_countries.wrappedValue)")
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            CustomTitle(title: "Enter your mobile number")
                .padding(.bottom, 30)
            
            VStack(alignment: .leading, spacing: 2) {
                CustomSubtitle(title: "Mobile Number")
                HStack {
                    Button(action: {
                        isCountryPickerPresented.toggle()
                    }, label: {
                        if let country = selectedCountry {
                            Text("\(country.flag) \(country.dial_code)")
                                .padding(.leading, 5)
                                .foregroundColor(Color(.label))
                        } else {
                            Text("Select Country")
                                .padding(.leading, 5)
                                .foregroundColor(Color(.label))
                        }
                    })
                    
                    TextField("93xxxxxxxxxx", text: $phoneNumber)
                        .keyboardType(.phonePad)
                        .padding()
                        .frame(height: 40)
                        .focused($focusedField, equals: .phoneNumber)
                }
                Divider()
            }
            
            Spacer()
            NavigationLink(destination: VerificationView()) {
                RoundNextButton { 
//                    showBanner.toggle()
                }
                    .allowsHitTesting(false)
                    .ignoresSafeArea(.keyboard)
        
            }
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Done") {
                    focusedField = nil
                }
            }
        }
//        .banner(data: bannerData, show: $showBanner)
        .sheet(isPresented: $isCountryPickerPresented) {
            CountryPickerView(isPresented: $isCountryPickerPresented, selectedCountry: $selectedCountry, countries: countries)
        }
    
    }
    
    func loadJson(_ filename: String) -> [Country] {
        if let url = Bundle.main.url(forResource: filename, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let countries = try JSONDecoder().decode([Country].self, from: data)
                return countries
            } catch {
                print("Error loading JSON data: \(error)")
            }
        } else {
            print("Failed to find JSON file")
        }
        return []
    }


}

#Preview {
    InputNumberView()
}


