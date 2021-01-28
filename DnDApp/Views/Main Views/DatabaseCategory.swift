import SwiftUI

struct SpellDatabaseView: View {
    @ObservedObject var listVM = DatabaseListViewModel()
    
    let spells = spellTestData

    @State var presentAddNewItem = false
    
    
    //All placeholder at the moment. Will eventually loop thought the relevent database category and display all items to be tapped on.
    
    var body: some View {
        VStack {
            List{
                ForEach(listVM.spellViewModel){ spellVM in
                    ListCell(spellVM: spellVM)
                }
                if presentAddNewItem {
//                    ListCell(spellVM: SpellViewModel(spell: Spell(name: "", level: 3, school: "", castTime: "kjadhsf", range: "sdlkhf", components: "dslknf", duration: "l;asdkfn", ritual: true, description: "aklsjdf"))){ spell in
//                        self.listVM.addSpell(spell: spell)
//                        self.presentAddNewItem.toggle()
//                    }
                }
            }
            Button(action: {self.presentAddNewItem.toggle()}) {
                Text("button")
            }
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
    
    var onCommit: (Spell) -> (Void) = { _ in}
    
    var body: some View{
        HStack {
            VStack(alignment: .center) {
                Text(spellVM.spell.name)
                
//                TextField("Please enter spell", text: $spellVM.spell.name, onCommit:{
//                    self.onCommit(self.spellVM.spell)
//                })
            }
            .padding()
        }
    }
}

//struct ListCell: View{
//    @ObservedObject var spellVM: SpellViewModel
//
//    var onCommit: (Spell) -> (Void) = { _ in}
//
//    var body: some View{
//        HStack {
//            VStack(alignment: .center) {
//                Text(spellVM.spell.name)
//
////                TextField("Please enter spell", text: $spellVM.spell.name, onCommit:{
////                    self.onCommit(self.spellVM.spell)
////                })
//            }
//            .padding()
//        }
//    }
//}
