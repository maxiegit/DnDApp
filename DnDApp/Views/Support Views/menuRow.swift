//
//  menuRow.swift
//  DnDApp
//
//  Created by Max Magill on 03/11/2020.
//

import SwiftUI

struct menuRow: View {
    let charName: String
    let campaignName: String
    let portrait: String
    let level: Int64

    init(charName: String, campaignName: String, portrait: String, level: Int64) {
        self.charName = charName
        self.campaignName = campaignName
        self.portrait = portrait
        self.level = level
    }

    var body: some View {
        HStack {
            Image(portrait)
                .resizable()
                .cornerRadius(/*@START_MENU_TOKEN@*/18.0/*@END_MENU_TOKEN@*/)
                .padding(.leading)
                .frame(width: 125, height: 115, alignment: .center/*@END_MENU_TOKEN@*/)

            Spacer()
            VStack(alignment: .trailing) {
                Text(charName)
                    .fontWeight(.light)
                    .multilineTextAlignment(.trailing)
                Text(String(level))
                    .fontWeight(.light)
                    .multilineTextAlignment(.trailing)
                Text(campaignName)
                    .fontWeight(.light)
                    .multilineTextAlignment(.trailing)
            }
            .padding(.trailing)
        }
    }
}

struct menuRow_Previews: PreviewProvider {
    static var previews: some View {
        menuRow(charName: "character name", campaignName: "campaign name", portrait: "aaliyah", level: 3)
    }
}
