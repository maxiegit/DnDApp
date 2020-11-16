//
//  CampaignScreenButton.swift
//  DnDApp
//
//  Created by Max Magill on 13/11/2020.
//

import SwiftUI

struct CampaignScreenButton: View {
    
    let destination: AnyView
    let symbol: String

    
    init(destination: AnyView, symbol: String) {
        self.destination = destination
        self.symbol = symbol
    }
    
    var body: some View {
        NavigationLink(destination: destination) {
            ZStack {
                Color.flatDarkCardBackground
                    .frame(width: 175, height: 175)
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                    .shadow(radius: 20)
                
                Image(systemName: symbol)
                    .resizable()
                    .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
//                    .overlay(Text("20")
//                                .font(.title)
//                                .foregroundColor(Color.black))
                
            }
        }
    }
    
    struct CampaignScreenButton_Previews: PreviewProvider {
        static var previews: some View {
            CampaignScreenButton(destination: AnyView(Roller()), symbol: "person.crop.square.fill")
        }
    }
}
