import SwiftUI

//Mode switch enum
enum Mode{
    case new
    case edit
    case read
}

enum Action {
    case delete
    case done
    case cancel
}

struct EditItem: View {
    
    @Environment(\.presentationMode) private var presentationMode
    @State var presentActionSheet = false
    
    @ObservedObject var itemModel = ItemViewModel()
    
    var mode: Mode = .new
    var completionHandler: ((Result<Action, Error>) -> Void)?
    
    var body: some View {
        VStack {
            NavigationView{
                Form{
                    Section(header: Text("Item")) {
                        TextField("Name", text: $itemModel.item.name)
                    }
                    Section(header: Text("Cost")) {
                        TextField("Cost", value: $itemModel.item.cost, formatter: NumberFormatter())
                    }
                    Section(header: Text("Weight")) {
                        TextField("Weight", value: $itemModel.item.weight, formatter: NumberFormatter())
                    }
                    Section(header: Text("Description")) {
                        TextField("Description", text: $itemModel.item.description)
                    }
                    
                    if(mode == .edit){
                        Button(action: {self.presentActionSheet.toggle()}) {
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
                .actionSheet(isPresented: $presentActionSheet, content: {
                    ActionSheet(title: Text("Are you sure?"),
                                buttons:[
                                .destructive(Text("Delete item"),
                                action: { delete() }),
                                .cancel()
                                ])
                })
            }
        }
    }
    
    // Condense closing and saving the document
    func done(){
        if(mode == .new){
            itemModel.addItem()
        }
        else{
            itemModel.updateItem()
        }
        self.presentationMode.wrappedValue.dismiss()
    }
    
    func delete(){
        itemModel.deleteItem()
        self.presentationMode.wrappedValue.dismiss()
        self.completionHandler?(.success(.delete))
    }
}



struct NewItem_Previews: PreviewProvider {
    static var previews: some View {
        EditItem()
    }
}
