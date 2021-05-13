import SwiftUI

struct EditArmor: View {

    @Environment(\.presentationMode) private var presentationMode
    @State var presentActionSheet = false

    @ObservedObject var armorModel = ArmorViewModel()

    var mode: Mode = .new
    var completionHandler: ((Result<Action, Error>) -> Void)?

    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Section(header: Text("Name")) {
                        TextField("Name", text: $armorModel.armor.name)
                    }
                    Section(header: Text("Cost")) {
                        TextField("Cost", value: $armorModel.armor.cost, formatter: NumberFormatter())
                    }
                    Section(header: Text("Weight")) {
                        TextField("Weight", value: $armorModel.armor.weight, formatter: NumberFormatter())
                    }
                    Section(header: Text("AC")) {
                        TextField("AC", value: $armorModel.armor.ac, formatter: NumberFormatter())
                    }
                    Section(header: Text("Type")) {
                        TextField("Type", text: $armorModel.armor.type)
                    }
                    Section(header: Text("Description")) {
                        TextField("Description", text: $armorModel.armor.description)
                    }
                    Section(header: Text("Magical")) {
                        Toggle("", isOn: $armorModel.armor.magic).labelsHidden()
                    }

                    if mode == .edit {
                        Button(action: {self.presentActionSheet.toggle()}) {
                            Text("Delete")
                                .foregroundColor(.red)
                        }
                    }

                }
                .background(Color.flatDarkBackground).ignoresSafeArea()
                .navigationTitle(mode == .new ? "New Armor" : "Edit \(armorModel.armor.name)")
                .navigationBarItems(leading: Button(action: {self.presentationMode.wrappedValue.dismiss()},
                                                    label: {
                                                        Text("Cancel")
                                                    }),
                                    trailing: Button(action: {done()}, label: {
                                        Text("Done")
                                    }))
                .actionSheet(isPresented: $presentActionSheet, content: {
                    ActionSheet(title: Text("Are you sure?"),
                                buttons: [
                                .destructive(Text("Delete armor"),
                                action: { delete() }),
                                .cancel()
                                ])
                })
            }
        }
    }

    // Condense closing and saving the document
    func done() {
        if mode == .new {
            armorModel.addArmor()
        } else {
            armorModel.updateArmor()
        }
        self.presentationMode.wrappedValue.dismiss()
    }

    func delete() {
        armorModel.deleteArmor()
        self.presentationMode.wrappedValue.dismiss()
        self.completionHandler?(.success(.delete))
    }
}

struct NewArmor_Previews: PreviewProvider {
    static var previews: some View {
        EditArmor()
    }
}
