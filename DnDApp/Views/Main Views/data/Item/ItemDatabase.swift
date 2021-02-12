import SwiftUI

struct ItemDatabaseView: View {
    @ObservedObject var listVM = DatabaseListViewModel()
    @StateObject var itemVM = ItemViewModel()

    
    @State private var toggleSheet = false
    
    var body: some View {
        VStack {
            List{
                ForEach(listVM.itemViewModel){ itemVM in
                    ItemCell(itemVM: itemVM)
                }
            }
            .toolbar {
                ToolbarItem{
                    Button(action: { toggleSheet.toggle() }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
        }
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

struct ItemCell: View{
    @ObservedObject var itemVM: ItemViewModel
    
    
    var body: some View{
        NavigationLink(destination: ItemDetailView(item: itemVM.item)){
                VStack{
                    Text(itemVM.item.name)
                }
            }
        
    }
}
