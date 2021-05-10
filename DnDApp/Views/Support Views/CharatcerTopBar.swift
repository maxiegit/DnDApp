import SwiftUI
import Combine

struct CharatcerTopBar: View {
    
    @ObservedObject var charVM: CharacterViewModel
    
    var body: some View {
        ZStack {
            Color.flatDarkBackground
                .frame(height: 180, alignment: .top)
                .shadow(radius: 20)
            
            VStack {
                TopBarStat(name: "name", number: charVM.character.name, charVM: charVM)
                    .font(.title3)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.top)
                
                ZStack {
                    HStack(spacing: 20){
                        TopBarStat(name: "ft.", number: String(charVM.character.speed), charVM: charVM)
                            .padding(.leading, 30)
                        TopBarStat(name: "Prof.", number: String(charVM.character.profBonus), charVM: charVM)
                            
                        Image("default")
                            .resizable()
                            .frame(width: 80, height: 75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .clipShape(Circle())
                            .multilineTextAlignment(.center)
//                            .position(x: 90, y: 375)
                        TopBarStat(name: "AC", number: String(charVM.character.ac), charVM: charVM)
                        TopBarStat(name: "HP", number: String(charVM.character.hp), charVM: charVM)
                            .padding(.trailing)
                        
                    }
                    .offset(x: 6.0)
                }
                
                HStack {
                    TopBarStat(name: "race", number: charVM.character.race, charVM: charVM)
                    TopBarStat(name: "class", number: charVM.character.classes, charVM: charVM)
                    TopBarStat(name: "Level", number: String(charVM.character.level), charVM: charVM)
                }
            }
        }
    }
}

struct TopBarStat: View {
    
    var name: String
    @State var number: String
    @ObservedObject var charVM: CharacterViewModel
    
    var body: some View{
        
        
        VStack{
            if(name == "race" || name == "class" || name == "name"){
                TextField(name, text: $number)
                    .onChange(of: number, perform: { newNumber in
                    changeNumber(numberChanging: name, number: number)
                })
                .fixedSize()
                .foregroundColor(.white)
            
            }
            else if(name == "Level"){
                TextField("", text: $number)
                    .keyboardType(.numberPad)
                    // santise input
                    .onReceive(Just(number)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.number = filtered
                        }
                    }
                    .onChange(of: number, perform: { newNumber in
                        changeNumber(numberChanging: name, number: number)
                    })
                    .fixedSize()
                    .foregroundColor(.white)
            }
            else{
            TextField("", text: $number)
                .keyboardType(.numberPad)
                // santise input
                .onReceive(Just(number)) { newValue in
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        self.number = filtered
                    }
                }
                .onChange(of: number, perform: { newNumber in
                    changeNumber(numberChanging: name, number: number)
                })
                .fixedSize()
                .foregroundColor(.white)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            
            if(name != "race" && name != "class" && name != "Level" && name != "name"){
                Text(name)
                    .font(.footnote)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
            }

        }
    }
    
    func changeNumber(numberChanging: String, number: String) {
        switch(numberChanging){
            case("ft."):
                charVM.character.speed = Int(number) ?? 0
                charVM.updateCharacter()
            case("Prof."):
                charVM.character.profBonus = Int(number) ?? 0
                charVM.updateCharacter()
            case("AC"):
                charVM.character.ac = Int(number) ?? 0
                charVM.updateCharacter()
            case("HP"):
                charVM.character.hp = Int(number) ?? 0
                charVM.updateCharacter()
            case("Level"):
                charVM.character.level = Int(number) ?? 0
                charVM.updateCharacter()
            case("race"):
                charVM.character.race = number
                charVM.updateCharacter()
            case("class"):
                charVM.character.classes = number
                charVM.updateCharacter()
            default:
                break
        }
    }
}

struct CharatcerTopBar_Previews: PreviewProvider {
    static var previews: some View {
        CharatcerTopBar(charVM: CharacterViewModel(character: Character(isDM: false, name: "Max Magill", race: "Human", classes: "Fighter", level: 0, exp: 0, alignment: "", background: "", ac: 10, hp: 100, tempHp: 0, speed: 0, profBonus: 2, hitDice: [], inspo: false, dstFailure: [false, false, false], dstSuccess: [false, false, false], strength: 0, dexterity: 0, constitution: 0, intellignece: 0, wisdom: 0, charisma: 0, personality: "", ideals: "", bonds: "", flaws: "", coreProficicies: [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false], saveProficicies: [false, false, false, false, false, false], otherProficicies: [], languageProficicies: [], armorProficicies: [], items: [], weapons: [], armor: [], cp: 0, sp: 0, gp: 0, ep: 0, pp: 0, attacks: [], classAbilities: [], spells: [], initiativeList: [])))
    }
}
