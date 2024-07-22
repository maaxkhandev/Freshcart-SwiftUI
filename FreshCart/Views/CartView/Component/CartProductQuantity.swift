import SwiftUI

struct CartProductQuantity: View {
    @ObservedObject var cartViewModel: CartViewModel
    let product: Product
    
    var body: some View {
        HStack {
            Button(action: {
                cartViewModel.manageQuantity(product: product, increase: false)
            }, label: {
                Image(systemName: "minus")
                    .font(.title3)
                    .foregroundColor(product.quantity > 1 ? Color.black : Color.gray)
                    .bold()
                    .frame(width: 40, height: 40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(style: StrokeStyle())
                            .foregroundColor(.gray.opacity(0.5))
                    )
            })
            Text("\(product.quantity)")
                .font(.title2)
                .foregroundColor(.black)
                .padding(.horizontal, 10)
            
            Button(action: {
                cartViewModel.manageQuantity(product: product, increase: true)
            }, label: {
                Image(systemName: "plus")
                    .font(.title3)
                    .foregroundColor(product.quantity > 1 ? Color.black : Color.accentColor)
                    .bold()
                    .frame(width: 40, height: 40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(style: StrokeStyle())
                            .foregroundColor(.gray.opacity(0.5))
                    )
            })
            Spacer()
            Text("$\(String(format: "%.2f", product.price * Double(product.quantity)))")
                .font(.title3)
                .foregroundColor(.black)
                .bold()
        }
    }
}
