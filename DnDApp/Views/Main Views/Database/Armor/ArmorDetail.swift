//
import SwiftUI

struct ArmorDetailView: View {
    
    @StateObject var armorModel = ArmorViewModel()
    @State var presentEditScreen: Bool = false
    @Environment(\.presentationMode) var presentationMode
    var armor: Armor
    
    
    var body: some View {
        VStack {
            Form{
                Section(header: Text("Name")){
                    Text(armor.name)
                }
                Section(header: Text("Cost")){
                    Text(String(armor.cost))
                }
                Section(header: Text("Weight")){
                    Text(String(armor.weight))
                }
                Section(header: Text("AC")){
                    Text(String(armor.ac))
                }
                Section(header: Text("Type")){
                    Text(armor.type)
                }
                Section(header: Text("Description")){
                    Text(armor.description)
                }
                Section(header: Text("Magical")){
                    Toggle("", isOn: $armorModel.armor.magic)
                        .labelsHidden()
                        .disabled(true)
                }
            }
            
            Button(action: {self.presentEditScreen.toggle()}) {
                Text("Edit")
            }
        }
        .sheet(isPresented: self.$presentEditScreen, content: {
            EditArmor(armorModel: ArmorViewModel(armor: armor), mode: .edit) { result in
                if case .success(let action) = result, action == .delete {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        })
    }
}

struct ArmorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let armor = Armor(name: "Chainmail", cost: 30, weight: 10, ac: 16, type: "Medium", magic: true, description: "A set of of chainmail")
        ArmorDetailView(armor: armor)
    }
}

