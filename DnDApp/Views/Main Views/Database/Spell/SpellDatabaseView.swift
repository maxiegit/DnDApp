import SwiftUI

struct SpellDatabaseView: View {
    @ObservedObject var listVM = DatabaseListViewModel()
    
    @State private var toggleSheet = false
    
    
    let spells = spellTestData
    
    var body: some View {
        VStack {
            List{
                ForEach(listVM.spellViewModel){ spellVM in
                    ListCell(spellVM: spellVM)
                }
            }
            .toolbar {
                ToolbarItem{
                    Button(action: { toggleSheet.toggle() }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
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

struct ListCell: View{
    @ObservedObject var spellVM: SpellViewModel
    
    var body: some View{
        NavigationLink(destination: SpellDetailView(spell: spellVM.spell)){
            VStack{
                Text(spellVM.spell.name)
            }
        }
    }
}
