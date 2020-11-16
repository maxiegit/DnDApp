//
//  DatabaseSection.swift
//  DnDApp
//
//  Created by Max Magill on 03/11/2020.
//

import SwiftUI

struct DatabaseSection: View {
    let image: String
    let section: String
    
    init(image: String, section: String) {
        self.image = image
        self.section = section
    }
    
    var body: some View {
        ZStack{
            Image(image)
                .resizable()
                .frame(width: 375, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(Capsule())
            
            Text(section)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.leading)
        }
    }
}

struct DatabaseSection_Previews: PreviewProvider {
    static var previews: some View {
        DatabaseSection(image: "bg1", section: "Spells")
    }
}
