import SwiftUI

struct Campaign: View {
    
    @ObservedObject var charVM: CharacterViewModel
    @Environment(\.presentationMode) private var presentationMode
    var completionHandler: ((Result<Action, Error>) -> Void)?
    @State var presentActionSheet = false

    var body: some View {
        ZStack{
            Color.flatDarkBackground.ignoresSafeArea()
            
            VStack(spacing: 20) {
                HStack(spacing: 25) {
                    CampaignScreenButton(destination: AnyView(RollerView()), symbol: "hexagon.fill")
                        .overlay(Text("20")
                                    .font(.title)
                                    .fontWeight(.light))
                    
                    if (charVM.character.isDM){
                        CampaignScreenButton(destination: AnyView(CharacterSheet(charVM: charVM)), symbol: "list.bullet")
                    }
                    else{
                        CampaignScreenButton(destination: AnyView(CharacterSheet(charVM: charVM)), symbol: "person.fill")
                    }
                }
                
                HStack(spacing: 25) {
                    CampaignScreenButton(destination: AnyView(CameraPlacehold()), symbol: "bubble.right.fill")

                    CampaignScreenButton(destination: AnyView(SpellDatabaseView()), symbol: "book.circle")
                }
                CampaignScreenButton(destination: AnyView(ProbabilityView()), symbol: "percent")
            }
            .padding(.bottom)
        }
        .navigationBarItems(trailing: Button(action: {presentActionSheet.toggle()}, label: {
            Image(systemName: "ellipsis.circle.fill")
        }))
        .actionSheet(isPresented: $presentActionSheet, content: {
            ActionSheet(title: Text("Are you sure?"),
                        buttons:[
                        .destructive(Text("Delete item"),
                        action: { delete() }),
                        .cancel()
                        ])
        })
    }
    
    func delete(){
        charVM.deleteCharacter()
        self.presentationMode.wrappedValue.dismiss()
        self.completionHandler?(.success(.delete))
    }
    
}




struct Campaign_Previews: PreviewProvider {
    static var previews: some View {
        Campaign(charVM: CharacterViewModel(character: Character(isDM: true, name: "", race: "", classes: "", level: 0, exp: 0, alignment: "", background: "", ac: 0, hp: 0, tempHp: 0, speed: 0, profBonus: 0, hitDice: [], inspo: false, dstFailure: [false, false, false], dstSuccess: [false, false, false], strength: 0, dexterity: 0, constitution: 0, intellignece: 0, wisdom: 0, charisma: 0, personality: "", ideals: "", bonds: "", flaws: "", coreProficicies: [true, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false],saveProficicies: [false, false, false, false, false, false], otherProficicies: [], languageProficicies: [], armorProficicies: [], items: [], weapons: [], armor: [], cp: 0, sp: 0, gp: 0, ep: 0, pp: 0, attacks: [], classAbilities: [], spells: [])))
    }
}
