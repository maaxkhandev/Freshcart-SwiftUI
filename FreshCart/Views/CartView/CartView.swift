import SwiftUI

struct CartView: View {
    @ObservedObject var cartViewModel: CartViewModel
    @ObservedObject var favoritesViewModel: FavoritesViewModel
    @State var isSheetPresented: Bool = false
    
    var body: some View {
        VStack {
            header
            Divider()
            
            VStack {
                if cartViewModel.products.isEmpty {
                    Spacer()
                    emptyCartView
                    Spacer()
                } else {
                    productList
                    Spacer()
                    cartTotalView
                }
            }
            .padding(.horizontal, 20)
        }
        .sheet(isPresented: $isSheetPresented) {
            CheckoutBottomsheet(isSheetPresented: $isSheetPresented)
        }
    }
    
    private var header: some View {
        Text("My Cart")
            .font(.title2)
            .bold()
    }
    
    private var productList: some View {
        ScrollView {
            VStack {
                ForEach(cartViewModel.products) { product in
                    NavigationLink {
                        ProductDetailView(product: product, favoritesViewModel: favoritesViewModel)
                    } label: {
                        ProductCartCard(cartViewModel: cartViewModel, product: product)
                    }
                }
            }
        }
    }
    
    private var emptyCartView: some View {
        ContentUnavailableView(
            "Your Cart is Empty",
            systemImage: "cart",
            description: Text("Your shopping cart is currently empty. Browse our shop to discover amazing products and add them to your cart.")
        )
        .padding()
    }
    
    private var cartTotalView: some View {
        VStack {
            HStack {
                Text("Total")
                    .font(.title3)
                    .bold()
                Spacer()
                Text("$\(String(format: "%.2f", cartViewModel.total))")
                    .font(.title3)
            }
            CustomButton(title: "Go To Checkout") {
                isSheetPresented.toggle()
            }
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    CartView(cartViewModel: CartViewModel(), favoritesViewModel: FavoritesViewModel())
}
