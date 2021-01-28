import SwiftUI

//Mode switch enum
enum Mode{
    case new
    case edit
}

struct EditItem: View {
    
    @Environment(\.presentationMode) private var presentationMode
    @State var presentActionSheet = false
    
    @ObservedObject var itemModel = ItemViewModel()
    
    var mode: Mode = .new
    
    var body: some View {
        VStack {
            NavigationView{
                Form{
                    Section(header: Text("Item")) {
                        TextField("Name", text: $itemModel.item.name)
                    }
                    
                    if(mode == .edit){
                        Button(action: {delete()}) {
                            Text("Delete")
                                .foregroundColor(.red)
                        }
                    }
                    
                }
                .navigationTitle(mode == .new ? "New Item" : "Edit \(itemModel.item.name)")
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
    func done(){
        if(mode == .new){
            itemModel.addItem()
            self.presentationMode.wrappedValue.dismiss()
        }
        else{
            itemModel.updateItem()
            self.presentationMode.wrappedValue.dismiss()
        }

    }
    
    func delete(){
        itemModel.deleteItem()
        self.presentationMode.wrappedValue.dismiss()
    }
    //Toogle function for edit and read mode
//    func toggleEnum(){
//        if (self.state == .read){
//            self.state = .edit
//        }
//        else{
//            self.state = .read
//        }
//    }
}



struct NewItem_Previews: PreviewProvider {
    static var previews: some View {
        EditItem()
    }
}
