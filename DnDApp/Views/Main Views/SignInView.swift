import SwiftUI
import AuthenticationServices

struct SignInView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var coord: SignInWithAppleCoordinator?
    
    var body: some View {
        ZStack {
            Color.flatDarkBackground.ignoresSafeArea()
            
            VStack {
                SignInButton()
                    .frame(width: 300, height: 45, alignment: .center)
                    .cornerRadius(10)
                    .onTapGesture {
                        self.coord = SignInWithAppleCoordinator()
                        if let coord = self.coord{
                            coord.startSignInWithAppleFlow {
                                print("Sign in successful")
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
                    }
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
