//
//  Campaign.swift
//  DnDApp
//
//  Created by Max Magill on 03/11/2020.
//

import SwiftUI

struct Campaign: View {
    var body: some View {
        ZStack{
            Color.flatDarkBackground.ignoresSafeArea()
            
            VStack(spacing: 20) {
                HStack(spacing: 25) {
                    CampaignScreenButton(destination: AnyView(Roller()), symbol: "hexagon.fill")
                        .overlay(Text("20")
                                    .font(.title)
                                    .fontWeight(.light))
                    CampaignScreenButton(destination: AnyView(DatabaseCategory()), symbol: "person.fill")
                }
                
                HStack(spacing: 25) {
                    CampaignScreenButton(destination: AnyView(Roller()), symbol: "bubble.right.fill")

                    CampaignScreenButton(destination: AnyView(DatabaseCategory()), symbol: "book.circle")
                }
            }
            .padding(.bottom)
        }
    }
}


struct Campaign_Previews: PreviewProvider {
    static var previews: some View {
        Campaign()
    }
}
