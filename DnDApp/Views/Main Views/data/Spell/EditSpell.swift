import SwiftUI

struct EditSpell: View {
    
    @State var isRitual = false
    @ObservedObject var spellModel = SpellViewModel()
    @Environment(\.presentationMode) var presentationMode
    @State var presentActionSheet = false
    
    
    var mode: Mode = .new
    var completionHandler: ((Result<Action, Error>) -> Void)?
    
    var body: some View {
        VStack {
            NavigationView{
                Form{
                    Section(header: Text("Spell")) {
                        TextField("Name", text: $spellModel.spell.name)
                    }
                    Section(header: Text("School")){
                        TextField("School", text: $spellModel.spell.school)
                    }
                    Section(header: Text("Range")){
                        TextField("Range", text: $spellModel.spell.range)
                    }
                    Section(header: Text("Cast Time")){
                        TextField("Cast Time", text: $spellModel.spell.castTime)
                    }
                    Section(header: Text("Duration")){
                        TextField("Duration", text: $spellModel.spell.duration)
                    }
                    Section(header: Text("Components")){
                        TextField("Components", text: $spellModel.spell.components)
                    }
                    Section(header: Text("Level")){
                        TextField("Level", value: $spellModel.spell.level, formatter: NumberFormatter())
                    }
                    Section(header: Text("Description")){
                        TextField("Description", text:$spellModel.spell.description)
                    }
                    
                    if(mode == .edit){
                        Button(action: {self.presentActionSheet.toggle()}) {
                            Text("Delete")
                                .foregroundColor(.red)
                        }
                    }
                }
                .navigationTitle(mode == .new ? "New Spell" : "Edit \(spellModel.spell.name)")
                .navigationBarItems(leading: Button(action: {self.presentationMode.wrappedValue.dismiss()},
                                                    label: {
                                                        Text("Cancel")
                                                    }),
                                    trailing: Button(action: {done()}, label: {
                                        Text("Done")
                                    }))
                .actionSheet(isPresented: $presentActionSheet, content: {
                    ActionSheet(title: Text("Are you sure?"),
                                buttons:[
                                    .destructive(Text("Delete spell"),
                                                 action: { delete() }),
                                    .cancel()
                                ])
                })
                
            }
        }
    }
    
    func done(){
        if(mode == .new){
            spellModel.addSpell()
        }
        else{
            spellModel.updateSpell()
        }
        self.presentationMode.wrappedValue.dismiss()
    }
    
    func delete(){
        spellModel.deleteSpell()
        self.presentationMode.wrappedValue.dismiss()
        self.completionHandler?(.success(.delete))
    }}



struct Newspell_Previews: PreviewProvider {
    static var previews: some View {
        EditSpell()
    }
}
