import SwiftUI

struct StatTab: View {

    @ObservedObject var charVM: CharacterViewModel
    
    var body: some View{
        ZStack {
            Color.flatDarkBackground.ignoresSafeArea()
                .onTapGesture {
                    self.hideKeyboard()
                }
            VStack(spacing: 0) {
                VStack(spacing: 20){
                    HStack(spacing: 30){
                        StatBox(stat: String(charVM.character.strength), statName: "Str", charVM: charVM)
                        StatBox(stat: String(charVM.character.dexterity), statName: "Dex", charVM: charVM)
                        StatBox(stat: String(charVM.character.constitution), statName: "Con", charVM: charVM)
                    }
                    HStack(spacing: 30){
                        StatBox(stat: String(charVM.character.intellignece), statName: "Int", charVM: charVM)
                        StatBox(stat: String(charVM.character.wisdom), statName: "Wis", charVM: charVM)
                        StatBox(stat: String(charVM.character.charisma), statName: "Cha", charVM: charVM)
                    }
                    ProfTable(charVM: charVM)
                        .ignoresSafeArea(.keyboard)
                    
                }
            }
        }
    }
}

struct StatTab_Previews: PreviewProvider {
    static var previews: some View {
        StatTab(charVM: CharacterViewModel())
    }
}
