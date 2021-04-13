import SwiftUI

struct ArmorDatabaseView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var charVM = CharacterViewModel()
    @ObservedObject var listVM = DatabaseListViewModel()
    @StateObject var armorVM = ArmorViewModel()
    @State var addToInventory = false

    
    
    @State private var toggleSheet = false
    
    var body: some View {
        NavigationView{
            VStack {
                List{
                    ForEach(listVM.armorViewModel){ armorVM in
                        if(addToInventory){
                            ArmorSelectionCell(armorVM: armorVM, charVM: charVM)
                        }
                        else{
                            ArmorCell(armorVM: armorVM)
                        }
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

struct ArmorSelectionCell: View {
    @ObservedObject var armorVM: ArmorViewModel
    @ObservedObject var charVM: CharacterViewModel


    @Environment(\.presentationMode) var presentationMode

    
    var body: some View{
        Text(armorVM.armor.name)
            .onTapGesture {
                charVM.character.armor.append(armorVM.armor)
                charVM.updateCharacter()
                presentationMode.wrappedValue.dismiss()
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
