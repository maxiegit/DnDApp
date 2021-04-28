//
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
                    Text("Spells")
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
                            NavigationLink(destination: SpellDetailView(spell: spell)){
                                VStack(alignment: .leading){
                                    Text(spell.name)
                                    Text(limitText(text: spell.description))
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        .onDelete(perform: deleteSpell)
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
