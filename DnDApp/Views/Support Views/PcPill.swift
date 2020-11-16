//
//  PcPill.swift
//  DnDApp
//
//  Created by Max Magill on 11/11/2020.
//

import SwiftUI

struct PcPill: View {
    
    let portrait: String
    let classIcon: String //will need to be an array to accomodate multiclassing
    let level: Int
    let race: String
    let name: String
    
    init(portrait: String, classIcon: String, level: Int, race: String, name: String) {
        self.portrait = portrait
        self.classIcon = classIcon
        self.level = level
        self.race = race
        self.name = name
    }
    
    var body: some View {
        
        ZStack(alignment: .leading){
            
            Color.flatDarkCardBackground
            HStack{
                Image(portrait)
                    .resizable()
                    .frame(width: 120, height: 120, alignment: .leading)
                    .clipShape(Circle())
                    .padding(.leading, 25)
                
                VStack(alignment: .leading){
                    HStack{
                        Image(classIcon)
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .leading)
                            .padding(.leading)
                        
                        Text("\(level)")
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundColor(Color.white)
                            .padding(.trailing, 30)
                        
                        Text(race)
                            .font(.body)
                            .fontWeight(.regular)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    }
                    
                    Text(name)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding([.top, .leading])
                }
            }
        }
        .frame(width: 355, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .clipShape(RoundedRectangle(cornerRadius: 50))
        .shadow(radius: 7 ).ignoresSafeArea(.all)
        .padding()
    }
    
}

struct PcPill_Previews: PreviewProvider {
    static var previews: some View {
        PcPill(portrait: "yass", classIcon: "barbarian", level: 20, race: "Aasimar", name: "Lyanna Hawthorn")
        
    }
}
