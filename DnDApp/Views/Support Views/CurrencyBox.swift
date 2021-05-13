import SwiftUI
import Combine

struct CurrencyBox: View {
    @State var currency: String
    var currencyName: String
    @ObservedObject var charVM: CharacterViewModel

    var body: some View {
        ZStack(alignment: .center) {
            Color.flatDarkCardBackground
                .frame(width: 60, height: 65, alignment: .center/*@END_MENU_TOKEN@*/)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 20)

            VStack {
                TextField("0", text: $currency)
                    // santise input
                    .keyboardType(.numberPad)
                    .onReceive(Just(currency)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.currency = filtered
                        }
                    }
                    .onChange(of: currency, perform: { _ in
                        currencyChange(currencyChanging: currencyName, currency: currency)
                    })
                    .fixedSize()
                    .foregroundColor(.white)
                    .font(Font.custom("OpenSans-Bold", size: 24))
                    .offset(y: 5)

                Text(currencyName)
                    .foregroundColor(.white)
                    .font(.subheadline)
            }
        }
    }

    func currencyChange(currencyChanging: String, currency: String) {
        switch currencyChanging {
            case("CP"):
                charVM.character.cp = Int(currency) ?? 0
                charVM.updateCharacter()
            case("SP"):
                charVM.character.sp = Int(currency) ?? 0
                charVM.updateCharacter()
            case("GP"):
                charVM.character.gp = Int(currency) ?? 0
                charVM.updateCharacter()
            case("EP"):
                charVM.character.ep = Int(currency) ?? 0
                charVM.updateCharacter()
            case("PP"):
                charVM.character.pp = Int(currency) ?? 0
                charVM.updateCharacter()
            default:
                break
        }
    }
}

struct CurrencyBox_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyBox(currency: "45", currencyName: "GP", charVM: CharacterViewModel())
    }
}
