//
//  DeathSavingThrow.swift
//  DnDApp
//
//  Created by Max Magill on 26/04/2021.
//

import SwiftUI

struct DeathSavingThrow: View {
    
    @ObservedObject var charVM: CharacterViewModel
    
    var body: some View {
        ZStack{
            Color.flatDarkBackground
                .frame(width: 300, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(10)
            VStack{
                VStack{
                    Text("Success")
                        .foregroundColor(.white)
                        .font(.title)
                    
                    
                    HStack(spacing: 40){
                        dstCheck(charVM: charVM, isChecked: charVM.character.dstSuccess[0], type: "Success", index: 0)
                        dstCheck(charVM: charVM, isChecked: charVM.character.dstSuccess[1], type: "Success", index: 1)
                        dstCheck(charVM: charVM, isChecked: charVM.character.dstSuccess[2], type: "Success", index: 2)
                    }
                }
                .padding(.bottom)
                VStack{
                    Text("Failure")
                        .foregroundColor(.white)
                        .font(.title)
                    
                    HStack(spacing: 40){
                        dstCheck(charVM: charVM, isChecked: charVM.character.dstSuccess[0], type: "Failure", index: 0)
                        dstCheck(charVM: charVM, isChecked: charVM.character.dstSuccess[1], type: "Failure", index: 1)
                        dstCheck(charVM: charVM, isChecked: charVM.character.dstSuccess[2], type: "Failure", index: 2)
                    }
                }
            }
        }
    }
}


struct dstCheck: View {
    @ObservedObject var charVM: CharacterViewModel
    @State var isChecked: Bool
    var type: String
    var index: Int
    
    var body: some View{
        if (isChecked){
            Image(systemName: "circle.fill")
                .foregroundColor(.white)
                .font(.system(size: 20))
                .onTapGesture(perform: {
                    isChecked.toggle()
                    if(type == "Success"){
                        charVM.character.dstSuccess[index].toggle()
                        print("tap")
                    }
                    else{
                        charVM.character.dstFailure[index].toggle()
                    }
                    charVM.updateCharacter()
                })
        }
        else{
            Image(systemName: "circle")
                .foregroundColor(.white)
                .font(.system(size: 20))
                .onTapGesture(perform: {
                    isChecked.toggle()
                    if(type == "Success"){
                        charVM.character.dstSuccess[index].toggle()
                    }
                    else{
                        charVM.character.dstFailure[index].toggle()
                    }
                    charVM.updateCharacter()
                })

        }
    }
}

struct DeathSavingThrow_Previews: PreviewProvider {
    static var previews: some View {
        DeathSavingThrow(charVM: CharacterViewModel())
    }
}
