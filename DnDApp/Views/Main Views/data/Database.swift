import SwiftUI

struct Database: View {
    var body: some View {
        ZStack {
            Color.flatDarkBackground.ignoresSafeArea()
            ScrollView {
                VStack {
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
                    NavigationLink(destination: WeaponDatabaseView()){
                        DatabaseSection(section: "Weapons")
                    }
                    NavigationLink(destination: BackgroundDatabaseView()){
                        DatabaseSection(section: "Backgrounds")
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
