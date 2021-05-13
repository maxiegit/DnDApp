import SwiftUI

struct SpellDetailView: View {

    @StateObject var spellModel = SpellViewModel()
    @Environment(\.presentationMode) var presentaionMode
    @State var presentEditScreen = false

    var spell: Spell

    var body: some View {
        VStack {
            Form {
                Section(header: Text("Name")) {
                    Text(spell.name)
                }
                Section(header: Text("School")) {
                    Text(spell.school)
                }
                Section(header: Text("Range")) {
                    Text(spell.range)
                }
                Section(header: Text("Cast Time")) {
                    Text(spell.castTime)
                }
                Section(header: Text("Duration")) {
                    Text(spell.duration)
                }
                Section(header: Text("Components")) {
                    Text(spell.components)
                }
                Section(header: Text("Level")) {
                    Text(String(spell.level))
                }
                Section(header: Text("Ritual")) {
                    Toggle("", isOn: $spellModel.spell.ritual)
                        .labelsHidden()
                        .disabled(true)

                }

                Section(header: Text("Description")) {
                    Text(spell.description)
                }
            }
            Button(action: {self.presentEditScreen.toggle()}) {
                Text("Edit")
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .sheet(isPresented: self.$presentEditScreen, content: {
            EditSpell(spellModel: SpellViewModel(spell: spell), mode: .edit) { result in
                if case .success(let action) = result, action == .delete {
                    self.presentaionMode.wrappedValue.dismiss()
                }
            }
        })
    }

    func cancel() {
        dismiss()
    }

    func done() {
        dismiss()
    }

    func dismiss() {
        presentaionMode.wrappedValue.dismiss()
    }
}

struct SpellDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let spell = Spell(name: "Fireball", level: 3, school: "Evocation", castTime: "1 Action", range: "120 ft", components: "V, S, M", duration: "Instant", description: "Hurl a fireball at the target", ritual: false)
        SpellDetailView(spell: spell)
    }
}
