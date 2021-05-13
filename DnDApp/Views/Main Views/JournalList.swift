import SwiftUI

struct JournalList: View {

    @ObservedObject var charVm: CharacterViewModel

    var body: some View {
        Form {
            Section {
                List {
                    ForEach(charVm.character.journal, id: \.self) { journal in
                        NavigationLink(destination: JournalView(charVm: charVm, index: charVm.character.journal.firstIndex(of: journal)!)) {
                            VStack(alignment: .leading) {
                                Text(journal.name)
                                    .font(.title2)
                                Spacer()
                                Text(limitText(text: journal.text))
                            }
                        }
                    }
                    .onDelete(perform: deleteJournal)
                }
            }
        }
        .background(Color.flatDarkBackground).ignoresSafeArea()
        .navigationBarItems(trailing: Button(action: {
            charVm.character.journal.append(Journal(name: "New Entry", text: ""))
            charVm.updateCharacter()
        }, label: {
            Image(systemName: "plus")
        }))
    }

    func deleteJournal(at offsets: IndexSet) {
        charVm.character.journal.remove(atOffsets: offsets)
        charVm.updateCharacter()
    }

    func limitText(text: String) -> String {
        if text.count > 20 {
            var cutText = text.substring(toIndex: 40)
            cutText += "..."
            return cutText
        } else {
            return text
        }
    }

}

struct JournalList_Previews: PreviewProvider {
    static var previews: some View {
        JournalList(charVm: CharacterViewModel(character: PlayerCharacter(
                                                isDM: false, name: "Max Magill",
                                                race: "Human",
                                                classes: "Fighter",
                                                level: 3, exp: 0,
                                                alignment: "", background: "",
                                                ac: 23, hp: 20, tempHp: 0,
                                                speed: 0, profBonus: 2,
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
                                                spells: [
                                                    Spell(name: "Firebolt", level: 0, school: "Evocation", castTime: "1 Action", range: "120 ft", components: "V, S", duration: "Instant", description: "You hurl a mote of fire at a creature or object within range. Make a ranged spell attack against the target. On a hit, the target takes 1d10 fire damage. A flammable object hit by this spell ignites if it isn't being worn or carried.", ritual: false)
                                                ],
                                                initiative: [], journal: [Journal(name: "Test", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ac dui imperdiet, tristique dolor vitae, feugiat felis. Proin ac tortor vestibulum, porta nulla vitae, blandit odio. Vestibulum consectetur tempor elementum. In pellentesque quam vel erat laoreet vehicula. Donec commodo varius. ")])))
    }
}
