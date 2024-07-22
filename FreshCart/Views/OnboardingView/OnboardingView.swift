import SwiftUI

struct OnboardingView: View {
    var body: some View {
//        NavigationView(content: {
            ZStack(alignment: .bottom) {
                Image("onboarding")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
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
                    
                    NavigationLink(destination: SocialSigninView()) {
                        CustomButton(title: "Get Started"){
                            
                        } .allowsHitTesting(false)
                                        }
                    

                  
                }
              
                .padding(.horizontal, 20)
                .padding(.bottom, 60)
                
                .background(
                    LinearGradient(colors: [Color.black.opacity(0.9), Color.clear], startPoint: .bottom, endPoint: .top))
            }
           
//        })
        
        
    }
}

#Preview {
    OnboardingView()
}
