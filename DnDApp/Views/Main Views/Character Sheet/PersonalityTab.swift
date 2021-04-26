import SwiftUI

struct PersonalityTab: View {
    
    @ObservedObject var charVM: CharacterViewModel

    var body: some View {
        Form{
            Section(header: Text("Alignment"), content: {
                TextField("", text: $charVM.character.alignment)
            })
            Section(header: Text("Background"), content: {
                    Text(charVM.character.background)
                })
            Section(header: Text("Personality Traits"), content: {
                NavigationLink(destination: Editor(charVM: charVM, txt: charVM.character.personality, trait: "personality")){
                    Text(charVM.character.personality)
                }
            })
            Section(header: Text("Ideals"), content: {
                NavigationLink(destination: Editor(charVM: charVM, txt: charVM.character.ideals, trait: "ideals")){
                    Text(charVM.character.ideals)
                }
            })
            Section(header: Text("Bonds"), content: {
                NavigationLink(destination: Editor(charVM: charVM, txt: charVM.character.bonds, trait: "bonds")){
                    Text(charVM.character.bonds)
                }
            })
            Section(header: Text("Flaws"), content: {
                NavigationLink(destination: Editor(charVM: charVM, txt: charVM.character.flaws, trait: "flaws")){
                    Text(charVM.character.flaws)
                }
            })
        }
        .onTapGesture {
            self.hideKeyboard()
        }
    }
}

struct Editor: View {
    @ObservedObject var charVM: CharacterViewModel
    @State var txt: String
    var trait: String
    
    var body: some View{
        TextEditor(text: $txt)
            .onChange(of: txt, perform: { value in
                traitChanging(text: txt, trait: trait)
            })
            .onDisappear(perform: {
                charVM.updateCharacter()
            })
    }
    
    func traitChanging(text: String, trait: String){
        switch trait {
        case "personality":
            charVM.character.personality = txt
        case "ideals":
            charVM.character.ideals = txt
        case "bonds":
            charVM.character.bonds = txt
        case "flaws":
            charVM.character.flaws = txt
        default:
            break
        }
    }
    
}

struct PersonalityTab_Previews: PreviewProvider {
    static var previews: some View {
        PersonalityTab(charVM: CharacterViewModel(character: Character(
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
