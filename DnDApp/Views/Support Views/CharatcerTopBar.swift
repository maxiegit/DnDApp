import SwiftUI

struct CharatcerTopBar: View {
    
    @ObservedObject var charVM: CharacterViewModel
    
    var body: some View {
        ZStack {
            Color.flatDarkBackground
                .frame(height: 220, alignment: .top)
                .shadow(radius: 20)
            
            VStack {
                Text(charVM.character.name)
                    .font(.title3)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.top)
                
                HStack(spacing: 20){
                    TopBarStat(name: "ft.", number: 30)
                    TopBarStat(name: "Prof.", number: charVM.character.profBonus)
                    Image("default")
                        .resizable()
                        .frame(width: 80, height: 75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .clipShape(Circle())
                        .multilineTextAlignment(.center)

                    TopBarStat(name: "AC", number: charVM.character.ac)
                    TopBarStat(name: "HP", number: charVM.character.hp)
                    
                }
                .offset(x: -6.0)
                
                HStack {
                    Text(charVM.character.race)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                    
                    Text(charVM.character.classes + " \(charVM.character.level)")
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                }
            }
        }
    }
}

struct TopBarStat: View {
    
    private var name: String
    private var number: Int
    
    init(name:String, number: Int) {
        self.name = name
        self.number = number
    }
    
    var body: some View{
        
        
        VStack{
            Text("\(number)")
                .font(.title)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.leading)

            Text(name)
                .font(.footnote)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)

        }
    }
}

struct CharatcerTopBar_Previews: PreviewProvider {
    static var previews: some View {
        CharatcerTopBar(charVM: CharacterViewModel(character: Character(name: "Max Magill", race: "Human", classes: "Fighter", level: 0, exp: 0, alignment: "", background: "", ac: 10, hp: 100, tempHp: 0, speed: 0, profBonus: 2, hitDice: [], inspo: false, dstFailure: 0, dstSuccess: 0, strength: 0, dexterity: 0, constitution: 0, intellignece: 0, wisdom: 0, charisma: 0, personality: "", ideals: "", bonds: "", flaws: "", coreProficicies: [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false], otherProficicies: [], languageProficicies: [], armorProficicies: [], items: [], weapons: [], armor: [], cp: 0, sp: 0, gp: 0, ep: 0, pp: 0, attacks: [], classAbilities: [], spells: [])))
    }
}
