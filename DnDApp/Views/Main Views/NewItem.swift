import SwiftUI

struct EditItem: View {
    
    @StateObject var itemModel = ItemViewModel()
    @Environment(\.presentationMode) var presentaionMode
    
    //Mode switch enum
    enum mode{
        case read
        case edit
    }
    
    var body: some View {
        VStack {
            NavigationView{
                Form{
                    Section(header: Text("Item")) {
                        TextField("Name", text: $itemModel.item.name)
                    }
                }
                .navigationBarItems(leading: Button(action: {presentaionMode.wrappedValue.dismiss()},
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
        itemModel.addItem()
        presentaionMode.wrappedValue.dismiss()
    }
    
    //Toogle function for edit and read mode
    func toggleEnum(){
        if (self.state == .read){
            self.state = .edit
        }
        else{
            self.state = .read
        }
    }
}



struct NewItem_Previews: PreviewProvider {
    static var previews: some View {
        EditItem()
    }
}
