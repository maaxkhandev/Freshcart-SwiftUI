import SwiftUI

struct ProductCartCard: View {
    @ObservedObject var cartViewModel: CartViewModel
    let product: Product
    
    var body: some View {
        VStack {
            HStack {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .padding()
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(product.name)
                            .font(.headline)
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Button(action: {cartViewModel.removeFromCart(product: product)}, label: {
                            Image(systemName: "multiply")
                                .foregroundColor(.black)
                        })
                    }
                    Text("\(product.quantity) \(product.quantityUnit), Price")
                    
                        .foregroundColor(.secondary)
                    
                    CartProductQuantity(cartViewModel: cartViewModel, product: product)
                }
            }
            Divider()
        }
       
    }
}
