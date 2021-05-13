import SwiftUI
import AuthenticationServices

struct SignInButton: UIViewRepresentable {

    func makeUIView(context contex: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(type: .signIn, style: .black)
    }

    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {

    }
}

struct SignInButton_Previews: PreviewProvider {
    static var previews: some View {
        SignInButton()
    }
}
