import SwiftUI

struct CharacterSheet: View{
    
    @ObservedObject var charVM: CharacterViewModel
    @StateObject var itemVM = ItemViewModel()
    @State var toggleSheet = (show: false, sheet: invSheet.item)
    @State var toggleItemSheet: Bool = false
    @State var toggleWeaponSheet: Bool = false
    @State var toggleArmorSheet: Bool = false
    
    enum invSheet {
        case item
        case wep
        case arm
    }
    
    var body: some View{
        ZStack {
            
            Color.flatDarkBackground.ignoresSafeArea()
            
            VStack {
                CharatcerTopBar(charVM: charVM)
                
                TabView() {
                    
                    // First tab
                    GeometryReader{ _ in
                        ZStack {
                            Color.flatDarkBackground.ignoresSafeArea()
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
                        .tabItem { Image(systemName: "person.crop.circle") }.tag(0)
                    }
                    
                    //Second Tab
                    VStack{
                        Form{
                            Section(header: HStack {
                                Text("Items")
                                Spacer()
                                Button(action: {
                                    toggleSheet.sheet = invSheet.item
                                    toggleSheet.show.toggle()
                                }, label: {
                                    Image(systemName: "plus")
                                        .font(.headline)
                                })
                            }){
                                List{
                                    ForEach(charVM.character.items, id: \.self){ item in
                                        NavigationLink(destination: ItemDetailView(item: item)) {
                                            VStack(alignment: .leading, spacing: 3){
                                                Text(item.name)
                                                    .font(.headline)
                                                    .multilineTextAlignment(.leading)
                                                
                                                Text(item.description)
                                                    .font(.subheadline)
                                                    .foregroundColor(.gray)
                                            }
                                        }
                                    }
                                    .onDelete(perform: deleteItem)
                                    
                                }
                            }
                            
                            Section(header: HStack {
                                Text("Weapons")
                                Spacer()
                                Button(action: {
                                    toggleSheet.sheet = invSheet.wep
                                    toggleSheet.show.toggle()
                                }, label: {
                                    Image(systemName: "plus")
                                        .font(.headline)
                                })
                            }){
                                List{
                                    ForEach(charVM.character.weapons, id: \.self){ weapon in
                                        NavigationLink(destination: WeaponDetailView(weapon: weapon)){
                                            VStack(alignment: .leading, spacing: 3){
                                                Text(weapon.name)
                                                    .font(.headline)
                                                    .multilineTextAlignment(.leading)
                                                
                                                Text(weapon.description)
                                                    .font(.subheadline)
                                                    .foregroundColor(.gray)
                                            }
                                        }
                                    }
                                    .onDelete(perform: deleteWep)
                                }
                            }
                            
                            Section(header: HStack {
                                Text("Armor")
                                Spacer()
                                Button(action: {
                                    toggleSheet.sheet = invSheet.arm
                                    toggleSheet.show.toggle()
                                    
                                }, label: {
                                    Image(systemName: "plus")
                                        .font(.headline)
                                })
                            }){
                                List{
                                    ForEach(charVM.character.armor, id: \.self){ armor in
                                        VStack(alignment: .leading, spacing: 3){
                                            Text(armor.name)
                                                .font(.headline)
                                            
                                            Text(armor.description)
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                            
                                        }
                                    }
                                    .onDelete(perform: deleteArmor)
                                }
                            }
                        }
                    }
                    .tabItem {
                        Image(systemName: "bag")
                        Text("Inventory")
                    }.tag(1)
                    Text("Tab Content 2").tabItem { Text("Actions") }.tag(2)
                    Text("Tab Content 2").tabItem { Text("Condition") }.tag(3)
                    Text("Tab Content 2").tabItem { Text("Equipment") }.tag(4)
                }
            }
            .onDisappear {charVM.updateCharacter()}
            .sheet(isPresented: $toggleSheet.show, content: {
                if(toggleSheet.sheet == .item){
                    ItemDatabaseView(charVM: charVM, addToInventory: true)
                }
                else if(toggleSheet.sheet == .wep){
                    WeaponDatabaseView(charVM: charVM, addToInventory: true)
                }
                else{
                    ArmorDatabaseView(charVM: charVM, addToInventory: true)
                }
            })
        }
        .onTapGesture {self.hideKeyboard()}
        .navigationBarTitle("", displayMode: .inline)
        
    }
    
    func deleteItem(at offsets: IndexSet) {
        charVM.character.items.remove(atOffsets: offsets)
        charVM.updateCharacter()
    }
    func deleteWep(at offsets: IndexSet) {
        charVM.character.weapons.remove(atOffsets: offsets)
        charVM.updateCharacter()
    }
    func deleteArmor(at offsets: IndexSet) {
        charVM.character.armor.remove(atOffsets: offsets)
        charVM.updateCharacter()
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
                                                        dstFailure: 0, dstSuccess: 0,
                                                        strength: 10, dexterity: 13, constitution: 16,
                                                        intellignece: 8, wisdom: 6, charisma: 20,
                                                        personality: "",
                                                        ideals: "",
                                                        bonds: "",
                                                        flaws: "",
                                                        coreProficicies: [true, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
                                                        otherProficicies: [],
                                                        languageProficicies: [],
                                                        armorProficicies: [],
                                                        items: [
                                                            Item(name: "Book", cost: 40, weight: 3, description: "A simple book"),
                                                            Item(name: "Rope", cost: 5, weight: 3, description: "A piece of rope")
                                                        ],
                                                        weapons: [Weapon(name: "Dagger", cost: 30, weight: 5, damage: "1d4", type: "Slashing", martial: false, magic: false, descriptors: [], description: "A simple dagger")],
                                                        armor: [Armor(name: "Chainmail", cost: 40, weight: 30, ac: 15, type: "heavy", magic: false, description: "A set of chainmail")],
                                                        cp: 0, sp: 0, gp: 0, ep: 0, pp: 0,
                                                        attacks: [],
                                                        classAbilities: [],
                                                        spells: [])))
        }
        
    }
}
