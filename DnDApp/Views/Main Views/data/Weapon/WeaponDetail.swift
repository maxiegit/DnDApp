import SwiftUI

struct WeaponDetailView: View {

    @StateObject var weaponModel = WeaponViewModel()
    @State var presentEditScreen: Bool = false
    @Environment(\.presentationMode) var presentationMode
    var weapon: Weapon

    var body: some View {
        VStack {
            Form {
                Section(header: Text("Name")) {
                    Text(weapon.name)
                }
                Section(header: Text("Cost")) {
                    Text(String(weapon.cost))
                }
                Section(header: Text("Weight")) {
                    Text(String(weapon.weight))
                }
                Section(header: Text("Damage")) {
                    Text(String(weapon.damage))
                }
                Section(header: Text("Type")) {
                    Text(String(weapon.type))
                }
                Section(header: Text("Martial")) {
                    Toggle("", isOn: $weaponModel.weapon.martial)
                        .labelsHidden()
                        .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
                Section(header: Text("Magic")) {
                    Toggle("", isOn: $weaponModel.weapon.magic)
                        .labelsHidden()
                        .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
                Section(header: Text("Descriptors")) {
                    List(weapon.descriptors, id: \.self) { desc in
                        Text(desc)
                    }
                }
                Section(header: Text("Description")) {
                    Text(String(weapon.description))
                }
            }
            Button(action: {self.presentEditScreen.toggle()}) {
                Text("Edit")
            }
        }
        .background(Color.flatDarkBackground).ignoresSafeArea()
        .navigationBarTitle("", displayMode: .inline)
        .sheet(isPresented: self.$presentEditScreen, content: {
            EditWeapon(weaponModel: WeaponViewModel(weapon: weapon), weapon: weapon, mode: .edit) { result in
                if case .success(let action) = result, action == .delete {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        })
    }
}

struct WeaponDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let weapon = Weapon(name: "lkjagh", cost: 0, weight: 0, damage: "1d8", type: "", martial: false, magic: false, descriptors: ["light", "finesse"], description: "")
        WeaponDetailView(weapon: weapon)
    }
}
