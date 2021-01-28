import SwiftUI

struct MainMenu: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color.flatDarkBackground.ignoresSafeArea()
                VStack() {
                    ScrollView{
                        //placeholder, will loop through all user chaartcers
                        cNav(name: "Lyanna Hawthorne", classIcon: "barbarian", race: "Half-Elf", portrait: "aaliyah", level: 13)
                    }
                }
            }
            .navigationBarItems(leading:NavigationLink(destination: Database()) {
                Image(systemName: "sparkles") //replace with more appropriate icon
            },
            trailing: Button("Add"){
            })
        }
    }
    
    // creates the navigation links out of menuRow
    private func cNav(name: String, classIcon: String, race: String, portrait: String, level: Int) -> NavigationLink<PcPill, Campaign>{
        //for cleaner creation on navigation links
        
        let navlink = NavigationLink(destination: Campaign()) {
            PcPill(portrait: portrait, classIcon: classIcon, level: level, race: race, name: name)
        }
        return navlink
    }
    
    
    struct Menu_Previews: PreviewProvider {
        static var previews: some View {
            MainMenu()
        }
    }
}
