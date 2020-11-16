//
//  test.swift
//  DnDApp
//
//  Created by Max Magill on 08/11/2020.
//

import SwiftUI

struct test: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [])
    private var spells: FetchedResults<Spell>
    
    var body: some View {
        NavigationView{
            List {
                //                ForEach(spells){spell in
                //                    Text(spell.name ?? "Untitled")
            }
        }
        .navigationTitle("test")
        .navigationBarItems(trailing: Button("Add"){
            addSpell()
        })
        
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
    
    private func addSpell(){
        let spell = Spell(context: viewContext)
        spell.name = "firebolt"
        
        saveContext()
    }
}





struct test_Previews: PreviewProvider {
    static var previews: some View {
        let persistenceContainer = PersistenceContainer.shared
        
        
        test()
            .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
    }
}
