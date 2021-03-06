import SwiftUI

struct WeaponDatabaseView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var charVM = CharacterViewModel()
    @ObservedObject var listVM = DatabaseListViewModel()
    @StateObject var weaponVM = WeaponViewModel()
    @State var addToInventory = false

    @State private var toggleSheet = false

    var body: some View {
            VStack {
                List {
                    ForEach(listVM.weaponViewModel) { weaponVM in
                        if addToInventory {
                            WeaponSelectionCell(weaponVM: weaponVM, charVM: charVM)
                        } else {
                            WeaponCell(weaponVM: weaponVM)
                        }
                    }
                    .listRowBackground(Color.flatDarkBackground)
                }
                .toolbar {
                    ToolbarItem {
                        Button(action: { toggleSheet.toggle() }, label: {
                            Image(systemName: "plus")
                        })
                    }
                }

            }
            .background(Color.flatDarkBackground).ignoresSafeArea()
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(leading: NavigationLink(destination: Database()) {
                Text("")
            })

            .sheet(isPresented: $toggleSheet, content: {
                EditWeapon(weapon: weaponVM.weapon)
            })
        }

        struct DatabaseCategory_Previews: PreviewProvider {
            static var previews: some View {
                WeaponDatabaseView()
            }
        }
}

struct WeaponSelectionCell: View {
    @ObservedObject var weaponVM: WeaponViewModel
    @ObservedObject var charVM: CharacterViewModel

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Text(weaponVM.weapon.name)
            .foregroundColor(.white)
            .onTapGesture {
                charVM.character.weapons.append(weaponVM.weapon)
                charVM.updateCharacter()
                presentationMode.wrappedValue.dismiss()
            }
    }
}

struct WeaponCell: View {
    @ObservedObject var weaponVM: WeaponViewModel

    var body: some View {
        NavigationLink(destination: WeaponDetailView(weapon: weaponVM.weapon)) {
            VStack {
                Text(weaponVM.weapon.name)
                    .foregroundColor(.white)
            }
        }
    }
}
