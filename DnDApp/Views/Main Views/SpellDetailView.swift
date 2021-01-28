import SwiftUI

struct SpellDetailView: View {
    
    @StateObject var spellModel = SpellViewModel()
    @Environment(\.presentationMode) var presentaionMode
    
    var spell: Spell
    
    var body: some View {
        VStack {
            NavigationView{
                Form{
                    Section(header: Text("Spell")) {
                        Text(spell.name)
                        Text(spell.school)
                        Text(spell.range)
                        Text(spell.castTime)
                        Text(spell.duration)
                        Text(spell.components)
                        Text(String(spell.level))
                        Text(spell.description)

                    }
                }
            }
        }
    }
    
    func cancel(){
        dismiss()
    }
    
    func done(){
        dismiss()
    }
    
    func dismiss(){
        presentaionMode.wrappedValue.dismiss()
    }
}

struct SpellDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let spell = Spell(name: "", level: 0, school: "", castTime: "", range: "", components: "", duration: "", description: "")
        SpellDetailView(spell: spell)
    }
}
