import SwiftUI

struct EditWeapon: View {
    
    @Environment(\.presentationMode) private var presentationMode
    @State var presentActionSheet = false
    @State var isEditMode: EditMode = .inactive
    
    @ObservedObject var weaponModel = WeaponViewModel()
    var weapon: Weapon
    
    var mode: Mode = .new
    var completionHandler: ((Result<Action, Error>) -> Void)?
    
    var body: some View {
        VStack {
            NavigationView{
                Form{
                    Section(header: Text("Name")){
                        TextField("Name", text: $weaponModel.weapon.name)
                    }
                    Section(header: Text("Cost")){
                        TextField("Cost", value: $weaponModel.weapon.cost, formatter: NumberFormatter())
                    }
                    Section(header: Text("Weight")){
                        TextField("Weight", value: $weaponModel.weapon.weight, formatter: NumberFormatter())
                    }
                    Section(header: Text("Type")){
                        TextField("Type", text: $weaponModel.weapon.type)
                    }
                    Section(header: Text("Damage")){
                        TextField("Damage", text: $weaponModel.weapon.damage)
                    }
                    Section(header: Text("Martial")){
                        Toggle("", isOn: $weaponModel.weapon.martial).labelsHidden()
                    }
                    Section(header: Text("Magical")){
                        Toggle("", isOn: $weaponModel.weapon.magic).labelsHidden()
                    }
                    Section(header: HStack{
                        Text("Descriptors")
                        Spacer()
                        Button(action: {
                            weaponModel.weapon.descriptors.append("")
                        }, label: {
                            Image(systemName: "plus")
                                .font(.headline)
                                    })
                    }, content:{
                        List{
                            ForEach(weaponModel.weapon.descriptors, id: \.self){
                                desc in
                                EditorView(container: $weaponModel.weapon.descriptors, index: weaponModel.weapon.descriptors.firstIndex(of: desc)!, text: desc)
                            }
                            .onDelete(perform: deleteListItem)
                        }
                    })
                    
                    Section(header: Text("Description")){
                        TextField("Description", text: $weaponModel.weapon.description)
                    }
                    
                    if(mode == .edit){
                        Button(action: {self.presentActionSheet.toggle()}) {
                            Text("Delete")
                                .foregroundColor(.red)
                        }
                    }
                }
                .navigationTitle(mode == .new ? "New Weapon" : "Edit \(weaponModel.weapon.name)")
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
                                .destructive(Text("Delete weapon"),
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
            weaponModel.addWeapon()
        }
        else{
            weaponModel.updateWeapon()
        }
        self.presentationMode.wrappedValue.dismiss()
    }
    
    func delete(){
        weaponModel.deleteWeapon()
        self.presentationMode.wrappedValue.dismiss()
        self.completionHandler?(.success(.delete))
    }
    
    func deleteListItem(at offsets: IndexSet){
        weaponModel.weapon.descriptors.remove(atOffsets: offsets)
    }
}



struct NewWeapon_Previews: PreviewProvider {
    static var previews: some View {
        EditWeapon(weapon: Weapon(name: "", cost: 0, weight: 0, damage: "", type: "", martial: false, magic: false, descriptors: ["light", "finesse"], description: ""))
    }
}
