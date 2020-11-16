//
//  ContentView.swift
//  DnDApp
//
//  Created by Max Magill on 03/11/2020.
//

import SwiftUI
import CoreData

struct MainMenu: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    //    @FetchRequest(entity: Spell.entity(), sortDescriptors: [])
    //    private var spells: FetchedResults<Spell>
    //
    @FetchRequest(entity: PC.entity(), sortDescriptors: [])
    var player: FetchedResults<PC>

    
    var body: some View {
        
        NavigationView{
            ZStack{
                Color.flatDarkBackground.ignoresSafeArea()
                VStack() {
                    ScrollView{
                        
                        cNav(name: "Lyanna Hawthorne", classIcon: "barbarian", race: "Half-Elf", portrait: "aaliyah", level: 13)
                        
                    }
                    Button("delete"){
                        
                    }
                }
            }
            .navigationBarItems(leading:NavigationLink(destination: Database()) {
                Image(systemName: "sparkles")
            },
            trailing: Button("Add"){
            })
        }
    }
    
    private func saveContext() {
        do{
            try viewContext.save()
        }
        catch
        {
            let error = error as NSError
            fatalError("\(error)")
        }
    }
    
    // creates the navigation links out of menuRow
    private func cNav(name: String, classIcon: String, race: String, portrait: String, level: Int) -> NavigationLink<PcPill, Campaign>{
        
        let navlink = NavigationLink(destination: Campaign()) {
            
            PcPill(portrait: portrait, classIcon: classIcon, level: level, race: race, name: name)
            
            
        }
        
        return navlink
    }
    
    
    // placeholder for making random data
    //    private func addChar(){
    //        let names = ["kara", "mene", "åine"]
    //        let cName = ["The reign of winter", "curse of strahd", "big bussy bitches"]
    //        let portraits = ["yaas", "aaliyah", "marge"]
    //        let newChar = PC(context: viewContext)
    //
    //        newChar.name = names[Int.random(in: 1...3)]
    //        newChar.campaign = cName[Int.random(in: 1...3)]
    //        newChar.portrait = portraits[Int.random(in: 1...3)]
    //        newChar.level = Int64.random(in: 1...20)
    //
    //        saveContext()
    //    }
    //}
    
    
    
    struct Menu_Previews: PreviewProvider {
        static var previews: some View {
            let persistenceContainer = PersistenceContainer.shared
            
            MainMenu()
                .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
        }
    }
}
