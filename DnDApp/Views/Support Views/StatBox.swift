import SwiftUI
import Combine

struct StatBox: View {

    @State var stat: String
    var statName: String
    @ObservedObject var charVM: CharacterViewModel

    var body: some View {
        ZStack(alignment: .center) {
            Color.flatDarkCardBackground
                .frame(width: 100/*@END_MENU_TOKEN@*/, height: 100/*@END_MENU_TOKEN@*/, alignment: .center/*@END_MENU_TOKEN@*/)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(radius: 20)

            VStack {
                TextField("0", text: $stat)
                    // santise input
                    .keyboardType(.numberPad)
                    .onReceive(Just(stat)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.stat = filtered
                        }
                    }
                    .onChange(of: stat, perform: { _ in
                        statChange(statChanging: statName, stat: stat)
                    })
                    .fixedSize()
                    .foregroundColor(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .offset(y: 5)

                Text(statName)
                    .foregroundColor(.white)
                    .font(.subheadline)
            }

            Color.flatDarkBackground
                .frame(width: 50, height: 35)
                .cornerRadius(5)
                .overlay(Text("\(charVM.bonusCalc(stat: Int(stat) ?? 0 ))").foregroundColor(.white))
                .offset(y: 55)

        }
    }

    func statChange(statChanging: String, stat: String) {
        switch statChanging {
            case("Str"):
                charVM.character.strength = Int(stat) ?? 0
                charVM.updateCharacter()
            case("Dex"):
                charVM.character.dexterity = Int(stat) ?? 0
                charVM.updateCharacter()
            case("Con"):
                charVM.character.constitution = Int(stat) ?? 0
                charVM.updateCharacter()
            case("Int"):
                charVM.character.intellignece = Int(stat) ?? 0
                charVM.updateCharacter()
            case("Wis"):
                charVM.character.wisdom = Int(stat) ?? 0
                charVM.updateCharacter()
            case("Cha"):
                charVM.character.charisma = Int(stat) ?? 0
                charVM.updateCharacter()
            default:
                break
        }
    }

}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        StatBox(stat: "9", statName: "Str", charVM: CharacterViewModel())
    }
}
