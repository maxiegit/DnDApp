import SwiftUI

struct ArmorDatabaseView: View {
    @ObservedObject var listVM = DatabaseListViewModel()
    @StateObject var armorVM = ArmorViewModel()
    
    
    @State private var toggleSheet = false
    
    var body: some View {
        NavigationView{
            VStack {
                List{
                    ForEach(listVM.armorViewModel){ armorVM in
                        ArmorCell(armorVM: armorVM)
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
                EditArmor()
            })
        }
    }
        struct DatabaseCategory_Previews: PreviewProvider {
            static var previews: some View {
                ArmorDatabaseView()
            }
        }
}

struct ArmorCell: View{
    @ObservedObject var armorVM: ArmorViewModel
    
    
    var body: some View{
        NavigationLink(destination: ArmorDetailView(armor: armorVM.armor)){
            VStack{
                Text(armorVM.armor.name)
            }
        }
    }
}
