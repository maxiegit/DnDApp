import SwiftUI

struct NewCharacter: View {

    @Environment(\.presentationMode) private var presentationMode
    @State var presentActionSheet = false

    @ObservedObject var charModel = CharacterViewModel()

    var completionHandler: ((Result<Action, Error>) -> Void)?

    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Section(header: Text("Name")) {
                        TextField("Name", text: $charModel.character.name)
                    }
                    if !charModel.character.isDM {
                        Section(header: Text("Level")) {
                            TextField("Level", value: $charModel.character.level, formatter: NumberFormatter())
                        }
                        Section(header: Text("Race")) {
                            TextField("Race", text: $charModel.character.race)
                        }
                        Section(header: Text("Class")) {
                            TextField("Class", text: $charModel.character.classes)
                        }
                    }
                    Section(header: Text("Dungeon Master")) {
                        Toggle(isOn: $charModel.character.isDM) {
                            Text("")
                        }
                        .labelsHidden()
                    }
                }
                .navigationTitle("New Character")
                .navigationBarItems(leading: Button(action: {self.presentationMode.wrappedValue.dismiss()},
                                                    label: {
                                                        Text("Cancel")
                                                    }),
                                    trailing: Button(action: {done()}, label: {
                                        Text("Done")
                                    }))

            }
        }
    }

    // Condense closing and saving the document
    func done() {
        charModel.addCharacter()
        self.presentationMode.wrappedValue.dismiss()
    }

    struct NewCharacter_Previews: PreviewProvider {
        static var previews: some View {
            NewCharacter()
        }
    }
}
