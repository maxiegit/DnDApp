import SwiftUI

struct ItemDetailView: View {

    @StateObject var itemModel = ItemViewModel()
    @State var presentEditScreen = false

    @Environment(\.presentationMode) var presentationMode
    var item: Item

    var body: some View {
        VStack {
            Form {
                Section(header: Text("Item")) {
                    Text(item.name)
                }
                Section(header: Text("Cost")) {
                    Text(String(item.cost) + " gp")
                }
                Section(header: Text("Weight")) {
                    Text(String(item.weight) + " lb")
                }
                Section(header: Text("Description")) {
                    Text(item.description)
                }
            }
            Button(action: {self.presentEditScreen.toggle()}) {
                Text("Edit")
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .sheet(isPresented: self.$presentEditScreen, content: {
            EditItem(itemModel: ItemViewModel(item: item), mode: .edit) { result in
                if case .success(let action) = result, action == .delete {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        })
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let item = Item(name: "Test", cost: 29, weight: 9, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id orci sem. Mauris vel tellus.")
        ItemDetailView(item: item)
    }
}
