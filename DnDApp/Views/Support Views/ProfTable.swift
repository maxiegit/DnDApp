import SwiftUI

struct ProfTable: View {
    
    @ObservedObject var charVM: CharacterViewModel
    
    
    var body: some View {
        ZStack{
            Color.flatDarkCardBackground
                .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: 250, alignment: .center)
                .cornerRadius(20)
                .padding()
//                .padding(.bottom, 25)
            
            HStack{
                VStack(spacing: 4){
                    ProfListItem(prof: "Acrobatics", isProf: charVM.character.coreProficicies[0], index: 0, charVM: charVM)
                    ProfListItem(prof: "Animal Handling", isProf: charVM.character.coreProficicies[1], index: 1, charVM: charVM)
                    ProfListItem(prof: "Arcana", isProf: charVM.character.coreProficicies[2], index: 2, charVM: charVM)
                    ProfListItem(prof: "Athletics", isProf: charVM.character.coreProficicies[3], index: 3, charVM: charVM)
                    ProfListItem(prof: "Deception", isProf: charVM.character.coreProficicies[4], index: 4, charVM: charVM)
                    ProfListItem(prof: "History", isProf: charVM.character.coreProficicies[5], index: 5, charVM: charVM)
                    ProfListItem(prof: "Insight", isProf: charVM.character.coreProficicies[6], index: 6, charVM: charVM)
                    ProfListItem(prof: "Intimidation", isProf: charVM.character.coreProficicies[7], index: 7, charVM: charVM)
                    ProfListItem(prof: "Investigtion", isProf: charVM.character.coreProficicies[8], index: 8, charVM: charVM)

                }
                VStack(spacing: 4){
                    ProfListItem(prof: "Medicine", isProf: charVM.character.coreProficicies[9], index: 9, charVM: charVM)
                    ProfListItem(prof: "Nature", isProf: charVM.character.coreProficicies[10], index: 10, charVM: charVM)
                    ProfListItem(prof: "Perception", isProf: charVM.character.coreProficicies[11], index: 11, charVM: charVM)
                    ProfListItem(prof: "Performance", isProf: charVM.character.coreProficicies[12], index: 12, charVM: charVM)
                    ProfListItem(prof: "Persuation", isProf: charVM.character.coreProficicies[13], index: 13, charVM: charVM)
                    ProfListItem(prof: "Religion", isProf: charVM.character.coreProficicies[14], index: 14, charVM: charVM)
                    ProfListItem(prof: "Slight of Hand", isProf: charVM.character.coreProficicies[15], index: 15, charVM: charVM)
                    ProfListItem(prof: "Stealth", isProf: charVM.character.coreProficicies[16], index: 16, charVM: charVM)
                    ProfListItem(prof: "Survival", isProf: charVM.character.coreProficicies[17], index: 17, charVM: charVM)
                }
            }
        }
    }
    
    struct ProfListItem: View{
        
        var prof: String
        @State var isProf: Bool
        var index: Int
        @ObservedObject var charVM: CharacterViewModel

        var body: some View{
            HStack{
                Text(prof)
                    .frame(maxWidth: 150, alignment: .leading)
                    .foregroundColor(.white)
                if(isProf){
                    Image(systemName: "circle.fill")
                        .foregroundColor(.white)
                        .onTapGesture(perform: {
                            isProf.toggle()
                            charVM.character.coreProficicies[index].toggle()
                            charVM.updateCharacter()
                        })
                }
                else{
                    Image(systemName: "circle")
                        .foregroundColor(.white)
                        .onTapGesture(perform: {
                            isProf.toggle()
                            charVM.character.coreProficicies[index].toggle()
                            charVM.updateCharacter()
                        })
                }
            }
        }
    }
    
    struct ProfTable_Previews: PreviewProvider {
        static var previews: some View {
            ProfTable(charVM: CharacterViewModel(character: Character(name: "", race: "", classes: "", level: 0, exp: 0, alignment: "", background: "", ac: 0, hp: 0, tempHp: 0, speed: 0, profBonus: 0, hitDice: [], inspo: false, dstFailure: 0, dstSuccess: 0, strength: 0, dexterity: 0, constitution: 0, intellignece: 0, wisdom: 0, charisma: 0, personality: "", ideals: "", bonds: "", flaws: "", coreProficicies: [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false], otherProficicies: [], languageProficicies: [], armorProficicies: [], items: [], weapons: [], armor: [], cp: 0, sp: 0, gp: 0, ep: 0, pp: 0, attacks: [], classAbilities: [], spells: [])))
        }
    }
}
