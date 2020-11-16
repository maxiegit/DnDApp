//
//  Database.swift
//  DnDApp
//
//  Created by Max Magill on 03/11/2020.
//

import SwiftUI

struct Database: View {
    var body: some View {
        ScrollView {
            VStack {
                NavigationLink(destination: Text("Spells!"))
                {
                    DatabaseSection(image: "bg1", section: "Spells")
                }
                .padding()
                DatabaseSection(image: "bg2", section: "Items")
            }
        }
    }
}

struct Database_Previews: PreviewProvider {
    static var previews: some View {
        Database()
    }
}
