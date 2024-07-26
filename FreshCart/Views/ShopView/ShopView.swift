import SwiftUI

struct ShopView: View {
    @State var search: String = ""
    @ObservedObject var cartViewModel: CartViewModel
    @ObservedObject var favoritesViewModel: FavoritesViewModel
    
    var body: some View {
        NavigationView { // Embedding in NavigationView
            VStack {
                ShopViewHeader()
                CustomSearchBar(text: $search, hint: "Search Store")
                    .padding(.bottom, 10)
                ScrollView {
                    VStack(spacing: 16) {
                        ShopViewBannerCard()
                        ExclusiveOfferList(cartViewModel: cartViewModel, favoritesViewModel: favoritesViewModel)
                        BestSellingList(cartViewModel: cartViewModel, favoritesViewModel: favoritesViewModel)
                            .padding(.bottom, 150)
                    }
                }
            }
            .navigationBarItems(trailing:
                                    NavigationLink(destination: {
                AddProductView()
            }, label: {
                Image(systemName: "plus.app.fill").font(.title2)
            })
            )
            
        }
    }
}

// Assuming you have previews properly set up
struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView(cartViewModel: CartViewModel(), favoritesViewModel: FavoritesViewModel())
    }
}
