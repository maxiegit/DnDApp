import SwiftUI

struct WeaponDatabaseView: View {
    @ObservedObject var listVM = DatabaseListViewModel()
    @StateObject var weaponVM = WeaponViewModel()
    
    
    @State private var toggleSheet = false
    
    var body: some View {
        NavigationView{
            VStack {
                List{
                    ForEach(listVM.weaponViewModel){ weaponVM in
                        WeaponCell(weaponVM: weaponVM)
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
                EditWeapon(weapon: weaponVM.weapon)
            })
        }
    }
        struct DatabaseCategory_Previews: PreviewProvider {
            static var previews: some View {
                WeaponDatabaseView()
            }
        }
}

struct WeaponCell: View{
    @ObservedObject var weaponVM: WeaponViewModel
    
    
    var body: some View{
        NavigationLink(destination: WeaponDetailView(weapon: weaponVM.weapon)){
            VStack{
                Text(weaponVM.weapon.name)
            }
        }
    }
}

