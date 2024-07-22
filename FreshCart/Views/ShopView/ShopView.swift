import SwiftUI

struct ShopView: View {
    @State var search: String = ""
    @ObservedObject var cartViewModel: CartViewModel
    @ObservedObject var favoritesViewModel: FavoritesViewModel
    var body: some View {
        VStack {
            ShopViewHeader()
            CustomSearchBar(text: $search,hint: "Search Store")
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
    }
}

#Preview {
    ShopView(cartViewModel: CartViewModel(), favoritesViewModel: FavoritesViewModel())
}
