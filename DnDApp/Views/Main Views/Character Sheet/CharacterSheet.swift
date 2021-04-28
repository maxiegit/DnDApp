import SwiftUI

public enum invSheet {
    case item
    case wep
    case arm
    case spell
}

struct CharacterSheet: View{
    
    @ObservedObject var charVM: CharacterViewModel
    @Environment(\.presentationMode) private var presentationMode
    var completionHandler: ((Result<Action, Error>) -> Void)?
    @State var presentActionSheet = false
    
    var body: some View{
        ZStack {
            
            Color.flatDarkBackground
                .ignoresSafeArea()
                .onTapGesture {self.hideKeyboard()}
            
            
            VStack {
                CharatcerTopBar(charVM: charVM)
                    .onTapGesture {self.hideKeyboard()}
                
                
                TabView() {
                    
                    // First tab
                    GeometryReader{ _ in
                        StatTab(charVM: charVM)
                    }
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("Stats")
                    }.tag(0)
//                    .onTapGesture {self.hideKeyboard()}
                    
                    
                    //Second Tab
                    GeometryReader{_ in
                        InventoryTab(charVM: charVM)
                    }
                    .tabItem {
                        Image(systemName: "bag")
                        Text("Inventory")
                    }.tag(1)
                    
                    //Third Tab
                    ActionsTab(charVM: charVM)
                        .tabItem {
                            Image(systemName: "staroflife.fill")
                            Text("Actions")
                        }.tag(2)
                    
                    //Fourth Tab
                    PersonalityTab(charVM: charVM).tabItem {
                        Image(systemName:"book")
                        Text("Personality")
                        
                    }.tag(3)
                    Condition(charVM: charVM).tabItem {
                        Image(systemName: "shield.fill")
                        Text("Condition")
                        
                    }.tag(4)
                }
            }
            .onDisappear {charVM.updateCharacter()}
        }
        .navigationBarTitle("", displayMode: .inline)
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
//        self.presentationMode.wrappedValue.dismiss()
        self.completionHandler?(.success(.delete))
    }
    
    struct CharatcerSheet_Previews: PreviewProvider {
        static var previews: some View {
            CharacterSheet(charVM: CharacterViewModel(character: Character(
                                                        name: "Max Magill",
                                                        race: "Human",
                                                        classes: "Fighter",
                                                        level: 3, exp: 0,
                                                        alignment: "", background: "",
                                                        ac: 23, hp: 20, tempHp: 0,
                                                        speed: 0, profBonus: 2,
                                                        hitDice: [],
                                                        inspo: false,
                                                        dstFailure: [false, false, false], dstSuccess: [false, false, false],
                                                        strength: 10, dexterity: 13, constitution: 16,
                                                        intellignece: 8, wisdom: 6, charisma: 20,
                                                        personality: "",
                                                        ideals: "",
                                                        bonds: "",
                                                        flaws: "",
                                                        coreProficicies: [true, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
                                                        saveProficicies: [false, false, false, false, false, false],
                                                        otherProficicies: [],

                                                        languageProficicies: [],
                                                        armorProficicies: [],
                                                        items: [
                                                            Item(name: "Book", cost: 40, weight: 3, description: "A simple book"),
                                                            Item(name: "Rope", cost: 5, weight: 3, description: "A piece of rope")
                                                        ],
                                                        weapons: [
                                                            Weapon(name: "Dagger", cost: 30, weight: 5, damage: "1d4", type: "Slashing", martial: false, magic: false, descriptors: [], description: "A simple dagger"),
                                                            Weapon(name: "Rapier", cost: 40, weight: 20, damage: "1d8", type: "Pericing", martial: true, magic: false, descriptors: ["light", "finesse"], description: "A standard issue rapier")],
                                                        armor: [Armor(name: "Chainmail", cost: 40, weight: 30, ac: 15, type: "heavy", magic: false, description: "A set of chainmail")],
                                                        cp: 0, sp: 0, gp: 0, ep: 0, pp: 0,
                                                        attacks: [],
                                                        classAbilities: [],
                                                        spells: [
                                                            Spell(name: "Firebolt", level: 0, school: "Evocation", castTime: "1 Action", range: "120 ft", components: "V, S", duration: "Instant", description: "You hurl a mote of fire at a creature or object within range. Make a ranged spell attack against the target. On a hit, the target takes 1d10 fire damage. A flammable object hit by this spell ignites if it isn't being worn or carried.", ritual: false)
                                                        ])))
        }
        
    }
}
