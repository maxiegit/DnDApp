import SwiftUI

struct InventoryTab: View {
    @ObservedObject var charVM: CharacterViewModel
    @State var toggleSheet = (show: false, sheet: invSheet.item)
    @State var toggleItemSheet: Bool = false
    @State var toggleWeaponSheet: Bool = false
    @State var toggleArmorSheet: Bool = false
    
    
    
    var body: some View{
        VStack{
            Form{
                Section(header: Text("Currency")){
                    HStack(spacing: 12){
                        CurrencyBox(currency: String(charVM.character.cp), currencyName: "CP", charVM: charVM)
                        CurrencyBox(currency: String(charVM.character.sp), currencyName: "SP", charVM: charVM)
                        CurrencyBox(currency: String(charVM.character.gp), currencyName: "GP", charVM: charVM)
                        CurrencyBox(currency: String(charVM.character.ep), currencyName: "EP", charVM: charVM)
                        CurrencyBox(currency: String(charVM.character.pp), currencyName: "PP", charVM: charVM)
                    }
                }
                
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
                                        .foregroundColor(.black)
                                    
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
            .sheet(isPresented: $toggleSheet.show, content: {
                if(toggleSheet.sheet == .item){
                    ItemDatabaseView(charVM: charVM, addToInventory: true)
                }
                else if(toggleSheet.sheet == .wep){
                    WeaponDatabaseView(charVM: charVM, addToInventory: true)
                }
                else if(toggleSheet.sheet == .arm){
                    ArmorDatabaseView(charVM: charVM, addToInventory: true)
                }
                else{
                    SpellDatabaseView()
                }
            })
        }
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
}

struct InventoryTab_Previews: PreviewProvider {
    static var previews: some View {
        InventoryTab(charVM: CharacterViewModel())
    }
}
