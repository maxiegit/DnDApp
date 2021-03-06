import SwiftUI

struct Campaign: View {

    @ObservedObject var charVM: CharacterViewModel
    @Environment(\.presentationMode) private var presentationMode
    var completionHandler: ((Result<Action, Error>) -> Void)?
    @State var presentActionSheet = false

    var body: some View {
        ZStack {
            Color.flatDarkBackground.ignoresSafeArea()

            VStack(spacing: 20) {
                HStack(spacing: 25) {
                    CampaignScreenButton(destination: AnyView(RollerView()), symbol: "hexagon.fill", width: 175, height: 175)
                        .overlay(Text("20")
                                    .font(.title)
                                    .fontWeight(.light))
                                    .foregroundColor(.black)

                    if charVM.character.isDM {
                        CampaignScreenButton(destination: AnyView(Initiative(charVM: charVM)), symbol: "list.bullet", width: 175, height: 175)
                    } else {
                        CampaignScreenButton(destination: AnyView(CharacterSheet(charVM: charVM)), symbol: "person.fill", width: 175, height: 175)
                    }
                }

                HStack(spacing: 25) {
                    CampaignScreenButton(destination: AnyView(ProbabilityView()), symbol: "percent", width: 175, height: 175)

                    CampaignScreenButton(destination: AnyView(JournalList(charVm: charVM)), symbol: "book.circle", width: 175, height: 175)
                }

                CampaignScreenButton(destination: AnyView(Database()), symbol: "archivebox.fill", width: 370, height: 150)
            }
            .padding(.bottom)
            .navigationBarTitle(charVM.character.name, displayMode: .inline)
        }
        .navigationBarItems(trailing: Button(action: {presentActionSheet.toggle()}, label: {
            Image(systemName: "ellipsis.circle.fill")
        }))
        .actionSheet(isPresented: $presentActionSheet, content: {
            ActionSheet(title: Text("Are you sure?"),
                        buttons: [
                        .destructive(Text("Delete"),
                        action: { delete() }),
                        .cancel()
                        ])
        })
    }

    func delete() {
        charVM.deleteCharacter()
        self.presentationMode.wrappedValue.dismiss()
        self.completionHandler?(.success(.delete))
    }

}

struct Campaign_Previews: PreviewProvider {
    static var previews: some View {
        Campaign(charVM: CharacterViewModel(character: PlayerCharacter(isDM: true, name: "", race: "", classes: "", level: 0, exp: 0, alignment: "", background: "", ac: 0, hp: 0, tempHp: 0, speed: 0, profBonus: 0, inspo: false, dstFailure: [false, false, false], dstSuccess: [false, false, false], strength: 0, dexterity: 0, constitution: 0, intellignece: 0, wisdom: 0, charisma: 0, personality: "", ideals: "", bonds: "", flaws: "", coreProficicies: [true, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false], saveProficicies: [false, false, false, false, false, false], otherProficicies: [], languageProficicies: [], armorProficicies: [], items: [], weapons: [], armor: [], cp: 0, sp: 0, gp: 0, ep: 0, pp: 0, spells: [], initiative: [], journal: [])))
    }
}
