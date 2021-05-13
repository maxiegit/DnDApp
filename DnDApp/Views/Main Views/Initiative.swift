import SwiftUI

struct Initiative: View {

    @ObservedObject var charVM: CharacterViewModel

    var body: some View {

        Form {
            Section(header: HStack {
                Text("Initiaive Order")
                Spacer()
                Button(action: {
                    charVM.character.initiative.append("")
                    charVM.updateCharacter()
                }, label: {
                    Image(systemName: "plus")
                        .font(.headline)
                })
            }) {
                List {
                    ForEach(charVM.character.initiative, id: \.self) { initi in
                        EditorView(container: $charVM.character.initiative, index: charVM.character.initiative.firstIndex(of: initi)!, text: initi)
                    }
                }
            }
            Section {
                Button(action: {
                    charVM.character.initiative = []
                    charVM.updateCharacter()
                }, label: {
                    Text("Clear")
                })
            }

        }
        .navigationBarTitle("", displayMode: .inline)

    }
}

struct Initiative_Previews: PreviewProvider {
    static var previews: some View {
        Initiative(charVM: CharacterViewModel())
    }
}
