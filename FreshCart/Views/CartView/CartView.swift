import SwiftUI

struct CartView: View {
    @ObservedObject var cartViewModel: CartViewModel
    @ObservedObject var favoritesViewModel: FavoritesViewModel
    @State var isSheetPresented: Bool = false
    
    var body: some View {
        VStack {
            Text("My Cart")
                .font(.title2)
                .bold()
            Divider()
         
            ScrollView {
                VStack {
                    ForEach(cartViewModel.products) { product in
                        NavigationLink {
                            ProductDetailView(product: product, favoritesViewModel: favoritesViewModel)
                        } label: {
                            ProductCartCard(cartViewModel: cartViewModel, product: product)
                        }
                        
                    }
                    Spacer()
                    HStack {
                        Text("Total")
                            .font(.title3)
                            .bold()
                        Spacer()
                        Text("$\(String(format: "%.2f", cartViewModel.total))")
                            .font(.title3)
                    }
                   
                    if cartViewModel.products.count > 0 {
                        CustomButton(title: "Go To Checkout") {
                            isSheetPresented.toggle()
                        }
                        .padding(.bottom, 20)
                    }
                    
                   
                }.padding(.horizontal, 20)
            }
        }
        .sheet(isPresented: $isSheetPresented, content: {
            CheckoutBottomsheet(isSheetPresented: $isSheetPresented)
        })
       
    }
}


#Preview {
    CartView(cartViewModel: CartViewModel(), favoritesViewModel: FavoritesViewModel())
}
