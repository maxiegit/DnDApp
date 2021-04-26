import SwiftUI

struct SavingThrowTable: View {
    
    @ObservedObject var charVM: CharacterViewModel
    
    var body: some View {
        ZStack{
            Color.flatDarkBackground
            HStack{
                VStack(alignment: .trailing, spacing: 10){
                    Save(charVM: charVM, isProf: charVM.character.saveProficicies[0], index: 0, prof: "Str")
                    Save(charVM: charVM, isProf: charVM.character.saveProficicies[1], index: 1, prof: "Dex")
                    Save(charVM: charVM, isProf: charVM.character.saveProficicies[2], index: 2, prof: "Con")
                }
                
                VStack(alignment: .trailing, spacing: 10){
                    Save(charVM: charVM, isProf: charVM.character.saveProficicies[3], index: 3, prof: "Int")
                    Save(charVM: charVM, isProf: charVM.character.saveProficicies[4], index: 4, prof: "WIs")
                    Save(charVM: charVM, isProf: charVM.character.saveProficicies[5], index: 5, prof: "Cha")
                }
            }
            
        }
        .frame(width: 240, height: 120, alignment: .center)
        .cornerRadius(10)
    }
}

struct Save: View {
    
    @ObservedObject var charVM: CharacterViewModel
    @State var isProf: Bool
    var index: Int
    var prof: String
    
    var body: some View{
        HStack{
            if(isProf){
                Text("\(prof)  \(charVM.bonusCalc(stat: getSave(index: index)) + charVM.character.profBonus)")
                    .foregroundColor(.white)
                Image(systemName: "circle.fill")
                    .foregroundColor(.white)
                    .onTapGesture(perform: {
                        isProf.toggle()
                        charVM.character.saveProficicies[index].toggle()
                        charVM.updateCharacter()
                    })
            }
            else{
                Text("\(prof)  \(charVM.bonusCalc(stat: getSave(index: index)))")
                    .foregroundColor(.white)
                    .padding(.leading)
                Image(systemName: "circle")
                    .foregroundColor(.white)
                    .onTapGesture(perform: {
                        isProf.toggle()
                        charVM.character.saveProficicies[index].toggle()
                        charVM.updateCharacter()
                    })
            }
        }
    }
    
    func getSave(index: Int) -> Int {
        var save: Int = 0
        
        switch index {
        case 0:
            save = charVM.character.strength
        case 1:
            save = charVM.character.dexterity
        case 2:
            save = charVM.character.constitution
        case 3:
            save = charVM.character.intellignece
        case 4:
            save = charVM.character.wisdom
        case 5:
            save = charVM.character.charisma
        default:
            break
        }
        
        return save
    }
    
}

struct SavingThrowTable_Previews: PreviewProvider {
    static var previews: some View {
        SavingThrowTable(charVM: CharacterViewModel())
    }
}
