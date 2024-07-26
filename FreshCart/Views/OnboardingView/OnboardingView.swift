import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("onboarding")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    VStack {
                        Image("carrot")
                        Text("Welcome\nto our store")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 5)
                        
                        Text("Get your groceries in as fast as one hour")
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                    }
                    
                    
                    NavigationLink(destination: SocialSigninView().environmentObject(authViewModel)) {
                        CustomButton(title: "Get Started") {}
                            .allowsHitTesting(false)
                    }
                    .padding(.bottom, 60)
                    .padding(.horizontal, 20)
                }
                .background(
                    LinearGradient(colors: [Color.black.opacity(0.9), Color.clear], startPoint: .bottom, endPoint: .top)

                )
            }
            
        }
    }
}

#Preview {
    OnboardingView()
        .environmentObject(AuthenticationViewModel())
}
