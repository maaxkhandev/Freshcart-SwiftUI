import SwiftUI

struct FavoritesView: View {
    @ObservedObject var cartViewModel: CartViewModel
    @ObservedObject var favoritesViewModel: FavoritesViewModel
    
    var body: some View {
        VStack {
            header
            Divider()
            if favoritesViewModel.favorites.isEmpty {
                Spacer()
                emptyFavoritesView
                Spacer()
            } else {
                favoriteProductsList
                addAllToCartButton
            }
        }
        .padding()
    }
    
    private var header: some View {
        Text("Favorites")
            .font(.title2)
            .bold()
    }
    
    private var favoriteProductsList: some View {
        ScrollView {
            VStack {
                ForEach(favoritesViewModel.favorites) { product in
                    NavigationLink {
                        ProductDetailView(product: product, favoritesViewModel: favoritesViewModel)
                    } label: {
                        FavoriteCard(product: product)
                    }
                }
            }
        }
    }
    
    private var emptyFavoritesView: some View {
        ContentUnavailableView(
            "Your Favorites is Empty",
            systemImage: "heart",
            description: Text("You haven't added any products to your favorites yet. Explore our shop and add items to your favorites for easy access.")
        )
        .padding()
    }
    
    private var addAllToCartButton: some View {
        if !favoritesViewModel.favorites.isEmpty {
            return AnyView(
                CustomButton(title: "Add All To Cart") {
                    addAllToCart()
                }
                .padding(.all, 20)
            )
        }
        return AnyView(EmptyView())
    }
    
    private func addAllToCart() {
        for product in favoritesViewModel.favorites {
            cartViewModel.addToCart(product: product)
        }
    }
}

#Preview {
    FavoritesView(cartViewModel: CartViewModel(), favoritesViewModel: FavoritesViewModel())
}
