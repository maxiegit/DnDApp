//
import SwiftUI

struct ItemDetailView: View {
    
    @StateObject var itemModel = ItemViewModel()
    @State var presentEditScreen = false
    @Environment(\.presentationMode) var presentaionMode
    
    var item: Item
    
    var body: some View {
        VStack {
            VStack {
                VStack {
                    NavigationView{
                        Form{
                            Section(header: Text("Item")) {
                                Text(item.name)
                                
                            }
                        }
                    }
                }
            }
            Button(action: {self.presentEditScreen.toggle()}) {
                Text("Edit")
            }
        }
        .sheet(isPresented: self.$presentEditScreen, content: {
            EditItem(itemModel: ItemViewModel(item: item), mode: .edit)
        })
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let item = Item(name: "Ring")
        ItemDetailView(item: item)
    }
}
