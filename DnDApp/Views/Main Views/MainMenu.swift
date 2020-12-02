//
//  ContentView.swift
//  DnDApp
//
//  Created by Max Magill on 03/11/2020.
//

import SwiftUI
import CoreData

struct MainMenu: View {
    
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
    
    // creates the navigation links out of menuRow
    private func cNav(name: String, classIcon: String, race: String, portrait: String, level: Int) -> NavigationLink<PcPill, Campaign>{
        
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
