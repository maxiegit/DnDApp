import SwiftUI

struct Condition: View {
    
    @StateObject var charVM: CharacterViewModel
    @State var toggleLangSheet: Bool = false
    @State var toggleProfSheet: Bool = false
    
    var body: some View {
        Form{
            Section(header: Text("Experience"), content: {
                TextField("0", value: $charVM.character.exp, formatter: NumberFormatter())
            })
            Section(header: Text("Inspiration"), content: {
                Toggle(isOn: $charVM.character.inspo, label: {
                    Text("")
                })
                .labelsHidden()

            })
            Section(header: Text("Temporary HP"), content: {
                TextField("0", value: $charVM.character.tempHp, formatter: NumberFormatter())
            })
            
            // Language List
            Section(header: HStack {
                Text("Languages")
                Spacer()
                Button(action: {
                    charVM.character.languageProficicies.append("")
                    charVM.updateCharacter()
                }, label: {
                    Image(systemName: "plus")
                        .font(.headline)
                })
            }, content: {
                List{
                    ForEach(charVM.character.languageProficicies, id: \.self){ lang in
                        EditorView(container: $charVM.character.languageProficicies, index: charVM.character.languageProficicies.firstIndex(of: lang)!, text: lang)
                    }
                    .onDelete(perform: deleteLanguage)
                }
            })
            
            //Other List
            Section(header: HStack {
                Text("Other Proficiencies")
                Spacer()
                Button(action: {
                    charVM.character.otherProficicies.append("")
                    charVM.updateCharacter()
                }, label: {
                    Image(systemName: "plus")
                        .font(.headline)
                })
            }, content: {
                List{
                    ForEach(charVM.character.otherProficicies, id: \.self){ prof in
                        EditorView(container: $charVM.character.otherProficicies, index: charVM.character.otherProficicies.firstIndex(of: prof)!, text: prof)
                    }
                    .onDelete(perform: deleteProficiency)
                }
            })
            
            Section(header: Text("Saving Throws"), content: {
                SavingThrowTable(charVM: charVM)
                    .padding(.leading, 45)
            })
            Section(header: Text("Death Saving Throws"), content: {
                DeathSavingThrow(charVM: charVM)
            })
        }
    }
    
    func deleteLanguage(at offsets: IndexSet){
        charVM.character.languageProficicies.remove(atOffsets: offsets)
        charVM.updateCharacter()
    }
    
    func deleteProficiency(at offsets: IndexSet){
        charVM.character.otherProficicies.remove(atOffsets: offsets)
        charVM.updateCharacter()
    }
}

struct Condition_Previews: PreviewProvider {
    static var previews: some View {
        Condition(charVM: CharacterViewModel(character: Character(
                                                name: "Max Magill",
                                                race: "Human",
                                                classes: "Fighter",
                                                level: 3, exp: 0,
                                                alignment: "Lawful Good", background: "Hermit",
                                                ac: 23, hp: 20, tempHp: 0,
                                                speed: 0, profBonus: 2,
                                                hitDice: [],
                                                inspo: false,
                                                dstFailure: [false, false, false], dstSuccess: [false, false, false],
                                                strength: 10, dexterity: 13, constitution: 16,
                                                intellignece: 8, wisdom: 6, charisma: 20,
                                                personality: "Charatcer Personality",
                                                ideals: "Ideals",
                                                bonds: "Bonds",
                                                flaws: "Flaws",
                                                coreProficicies: [true, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
                                                saveProficicies: [false, false, false, false, false, false],
                                                otherProficicies: ["Heavy Armor", "Alchemy Set"],
                                                languageProficicies: ["Orcish", "Elven", "Common"],
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
