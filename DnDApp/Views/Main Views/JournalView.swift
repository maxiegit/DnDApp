import SwiftUI

struct JournalView: View {

    @ObservedObject var charVm: CharacterViewModel
    var index: Int

    var body: some View {
        Form {
            Section {
                TextField("name", text: $charVm.character.journal[index].name)
            }
            Section {
                TextEditor(text: $charVm.character.journal[index].text)
                    .frame(height: 500)
            }
        }
        .background(Color.flatDarkBackground).ignoresSafeArea()
        .onDisappear(perform: {
            charVm.updateCharacter()
        })
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView(charVm: CharacterViewModel(), index: 0)
    }
}
