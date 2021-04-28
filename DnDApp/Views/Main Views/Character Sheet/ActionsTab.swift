import SwiftUI

struct ActionsTab: View {
    
    @ObservedObject var charVM: CharacterViewModel
    @State var toggleSheet = (show: false, sheet: invSheet.spell)
    
    var body: some View{
        VStack {
            Form{
                Section(header: Text("Weapons")){
                    List{
                        ForEach(charVM.character.weapons, id: \.self){ weapon in
                            VStack(alignment: .leading) {
                                HStack{
                                    Text(weapon.name)
                                    Spacer()
                                    Text(weapon.damage)
                                }
                                Text(weapon.type)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                Section(header: HStack {
                    Text("Cantrips")
                    Spacer()
                    Button(action: {
                        toggleSheet.sheet = invSheet.spell
                        toggleSheet.show.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .font(.headline)
                    })
                }){
                    List{
                        ForEach(charVM.character.spells, id: \.self){ spell in
                            spellCell(spell: spell, level: 0)
                        }
                        .onDelete(perform: deleteSpell)
                    }
                }
                Group {
                    Section(header:Text("1st level spells")){
                        List{
                            ForEach(charVM.character.spells, id: \.self){ spell in
                                spellCell(spell: spell, level: 1)
                                
                            }
                            .onDelete(perform: deleteSpell)
                        }
                    }
                    Section(header: Text("2nd Level spells")){
                        List{
                            ForEach(charVM.character.spells, id: \.self){ spell in
                                spellCell(spell: spell, level: 2)
                            }
                            .onDelete(perform: deleteSpell)
                        }
                    }
                    Section(header: Text("3nd Level spells")){
                        List{
                            ForEach(charVM.character.spells, id: \.self){ spell in
                                spellCell(spell: spell, level: 3)
                            }
                            .onDelete(perform: deleteSpell)
                        }
                    }
                    Section(header: Text("4th Level spells")){
                        List{
                            ForEach(charVM.character.spells, id: \.self){ spell in
                                spellCell(spell: spell, level: 4)
                            }
                            .onDelete(perform: deleteSpell)
                        }
                    }
                    Section(header: Text("5th Level spells")){
                        List{
                            ForEach(charVM.character.spells, id: \.self){ spell in
                                spellCell(spell: spell, level: 5)
                            }
                            .onDelete(perform: deleteSpell)
                        }
                    }
                }
                Group {
                    Section(header: Text("6th Level spells")){
                            List{
                                ForEach(charVM.character.spells, id: \.self){ spell in
                                    spellCell(spell: spell, level: 6)
                                }
                                .onDelete(perform: deleteSpell)
                            }
                    }
                    Section(header: Text("7th Level spells")){
                        List{
                            ForEach(charVM.character.spells, id: \.self){ spell in
                                spellCell(spell: spell, level: 7)
                            }
                            .onDelete(perform: deleteSpell)
                        }
                    }
                    Section(header: Text("8th Level spells")){
                        List{
                            ForEach(charVM.character.spells, id: \.self){ spell in
                                spellCell(spell: spell, level: 8)
                            }
                            .onDelete(perform: deleteSpell)
                        }
                    }
                    Section(header: Text("9nd Level spells")){
                        List{
                            ForEach(charVM.character.spells, id: \.self){ spell in
                                spellCell(spell: spell, level: 9)
                            }
                            .onDelete(perform: deleteSpell)
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $toggleSheet.show, content: {
            if(toggleSheet.sheet == .spell){
                SpellDatabaseView(charVM: charVM, addToInventory: true)
            }
        })
    }
    
    func deleteSpell(at offsets: IndexSet) {
        charVM.character.spells.remove(atOffsets: offsets)
        charVM.updateCharacter()
    }
}

struct spellCell:View {
    
    var spell: Spell
    var level: Int
    @State var isSelected: Bool = false
    
    var body: some View{
        if (spell.level == level){
            NavigationLink(destination: SpellDetailView(spell: spell)){
                HStack {
                    VStack(alignment: .leading){
                        Text(spell.name)
                        if(!spell.description.isEmpty){
                        Text(limitText(text: spell.description))
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        }
                    }
                }
            }
        }
    }
    
    func limitText(text: String) -> String {
        if text.count > 20 {
            var cutText = text.substring(toIndex: 40)
            cutText += "..."
            return cutText
        }
        else{
            return text
        }
    }
    
}

struct ActionsTab_Previews: PreviewProvider {
    static var previews: some View {
        ActionsTab(charVM: CharacterViewModel())
    }
}
