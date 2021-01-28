import SwiftUI

struct NewSpell: View {
    
    @State var isRitual = false
    @StateObject var spellModel = SpellViewModel()
    @Environment(\.presentationMode) var presentaionMode
    
    var body: some View {
        VStack {
            NavigationView{
                Form{
                    Section(header: Text("spell")) {
                        TextField("Name", text: $spellModel.spell.name)
                        TextField("School", text: $spellModel.spell.school)
                        TextField("Level", value: $spellModel.spell.level, formatter: NumberFormatter())
                        TextField("Components", text: $spellModel.spell.components)
                        TextField("Range", text: $spellModel.spell.range)
                        TextField("Cast Time", text: $spellModel.spell.castTime)
                        TextField("Duration", text: $spellModel.spell.duration)
                        TextField("Description", text: $spellModel.spell.description)
                    }
                }
                .navigationBarItems(leading: Button(action: {presentaionMode.wrappedValue.dismiss()}, label: {
                    Text("Cancel")
                }),
                trailing: Button(action: { done() }, label: {
                    Text("Done")
                }))
                
            }
        }
    }
    
    func done(){
        spellModel.addSpell()
        presentaionMode.wrappedValue.dismiss()
        
    }
}



struct Newspell_Previews: PreviewProvider {
    static var previews: some View {
        NewSpell()
    }
}
