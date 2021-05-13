import SwiftUI

struct ItemDatabaseView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var charVM = CharacterViewModel()
    @ObservedObject var listVM = DatabaseListViewModel()
    @StateObject var itemVM = ItemViewModel()
    @State var addToInventory = false
    @State private var toggleSheet = false

    var body: some View {

            VStack {
                List {
                    ForEach(listVM.itemViewModel) { itemVM in
                        if addToInventory {
                            ItemSelectionCell(itemVM: itemVM, charVM: charVM)
                        } else {
                            ItemCell(itemVM: itemVM)
                        }
                    }
                    .listRowBackground(Color.flatDarkBackground)
                }
                .toolbar {
                    ToolbarItem {
                        Button(action: { toggleSheet.toggle() }, label: {
                            Image(systemName: "plus")
                        })
                    }
                }
            }
            .background(Color.flatDarkBackground).ignoresSafeArea()
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(leading: NavigationLink(destination: Database()) {
                Text("")
            })
            .sheet(isPresented: $toggleSheet, content: {
                EditItem()
        })

    }

    struct DatabaseCategory_Previews: PreviewProvider {
        static var previews: some View {
            ItemDatabaseView()
        }
    }
}

struct ItemSelectionCell: View {
    @ObservedObject var itemVM: ItemViewModel
    @ObservedObject var charVM: CharacterViewModel

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Text(itemVM.item.name)
            .foregroundColor(.white)
            .onTapGesture {
                charVM.character.items.append(itemVM.item)
                charVM.updateCharacter()
                presentationMode.wrappedValue.dismiss()
            }
    }
}

struct ItemCell: View {
    @ObservedObject var itemVM: ItemViewModel

    var body: some View {
        NavigationLink(destination: ItemDetailView(item: itemVM.item)) {
            VStack {
                Text(itemVM.item.name)
                    .foregroundColor(.white)
            }
        }
    }
}
