import SwiftUI

struct Database: View {
    var body: some View {
        ZStack {
            Color.flatDarkBackground.ignoresSafeArea()
            ScrollView {
                VStack {
                    //TODO: have this loop through all collections and create buttons programatically
                    NavigationLink(destination: SpellDatabaseView())
                    {
                        DatabaseSection(section: "Spells")
                    }
                    NavigationLink(destination: ItemDatabaseView()){
                        DatabaseSection(section: "Items")
                    }
                    NavigationLink(destination: ArmorDatabaseView()){
                        DatabaseSection(section: "Armor")
                    }
                    NavigationLink(
                        destination: WeaponDatabaseView()){
                        DatabaseSection(section: "Weapons")
                    }
                }
            }
        }
    }

    
}

struct Database_Previews: PreviewProvider {
    static var previews: some View {
        Database()
    }
}
