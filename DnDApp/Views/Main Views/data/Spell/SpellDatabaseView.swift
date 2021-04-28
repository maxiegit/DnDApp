import SwiftUI

struct SpellDatabaseView: View {
    @ObservedObject var charVM = CharacterViewModel()
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var listVM = DatabaseListViewModel()
    @StateObject var spellVM = SpellViewModel()
    @State var addToInventory = false
    @State private var toggleSheet = false
        
    var body: some View {
        VStack {
            List{
                ForEach(listVM.spellViewModel){ spellVM in
                    if(addToInventory){
                        SpellSelectionCell(spellVM: spellVM, charVM: charVM)
                    }
                    else{
                        SpellCell(spellVM: spellVM)
                    }
                }
            }
            .toolbar {
                ToolbarItem{
                    Button(action: { toggleSheet.toggle() }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(leading: NavigationLink(destination: Database()) {
                Text("")
            })
            .sheet(isPresented: $toggleSheet, content: {
                EditSpell()
            })
        }
    }
    
    struct DatabaseCategory_Previews: PreviewProvider {
        static var previews: some View {
            SpellDatabaseView()
        }
    }
}

struct SpellSelectionCell: View {
    @ObservedObject var spellVM: SpellViewModel
    @ObservedObject var charVM: CharacterViewModel


    @Environment(\.presentationMode) var presentationMode

    
    var body: some View{
        Text(spellVM.spell.name)
            .onTapGesture {
                charVM.character.spells.append(spellVM.spell)
                charVM.updateCharacter()
                presentationMode.wrappedValue.dismiss()
            }
    }
}

struct SpellCell: View{
    @ObservedObject var spellVM: SpellViewModel
    
    var body: some View{
        NavigationLink(destination: SpellDetailView(spell: spellVM.spell)){
            VStack{
                Text(spellVM.spell.name)
            }
        }
    }
}
