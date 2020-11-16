//
//  CharacterSheet.swift
//  DnDApp
//
//  Created by Max Magill on 15/11/2020.
//

import SwiftUI

struct CharacterSheet: View {
    var body: some View {
        ZStack {
            Color.flatDarkBackground.ignoresSafeArea()
            VStack {
                CharatcerTopBar()
                    .ignoresSafeArea()
                
                Spacer()
                ScrollView(){
                }.ignoresSafeArea()
            }
            
        }
    }
}

struct CharacterSheet_Previews: PreviewProvider {
    static var previews: some View {
        CharacterSheet()
    }
}
