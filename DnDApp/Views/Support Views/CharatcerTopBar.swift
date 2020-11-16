//
//  CharatcerTopBar.swift
//  DnDApp
//
//  Created by Max Magill on 15/11/2020.
//

import SwiftUI

struct CharatcerTopBar: View {
    var body: some View {
        ZStack {
            Color.flatDarkCardBackground
                .frame(width: .infinity, height: 175, alignment: .top)
                .shadow(radius: 20)
            
            VStack {
                Text("name")
                    .font(.title3)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                
                HStack(spacing: 20){
                    TopBarStat(name: "ft.", number: 30)
                    TopBarStat(name: "Prof.", number: 2)
                    Image("yass")
                        .resizable()
                        .frame(width: 80, height: 75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    TopBarStat(name: "AC", number: 12)
                    TopBarStat(name: "HP", number: 11)
                    
                }
                
                Text("Race")
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                Text("Blood Hunter 20")
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct TopBarStat: View {
    
    private var name: String
    private var number: Int
    
    init(name:String, number: Int) {
        self.name = name
        self.number = number
    }
    
    var body: some View{
        
        
        VStack{
            Text("\(number)")
                .font(.title)
                .foregroundColor(Color.white)
            Text(name)
                .font(.footnote)
                .foregroundColor(Color.white)
        }
    }
}

struct CharatcerTopBar_Previews: PreviewProvider {
    static var previews: some View {
        CharatcerTopBar()
    }
}
