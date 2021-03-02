import SwiftUI

struct DiceSection: View {

    let symbol: String
    let sides: Int
    
    init(symbol: String, sides: Int) {
        self.symbol = symbol
        self.sides = sides
    }
    
    @State private var tapped = false
    
    var body: some View {
        ZStack {
            if(tapped){
                Color.blue
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 20)
            }
            else{
                Color.flatDarkCardBackground
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 20)
            }
            
            Image(systemName: symbol)
                .resizable()
                .foregroundColor(.white)
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .overlay(Text("\(sides)")
                            .fontWeight(.light)
                            .foregroundColor(Color.black))
        }
        .onTapGesture {
            tapped.toggle()
//            self.rollerVM.setSides(numOfSides: sides)
//            print("\(self.rollerVM.sides)")
        }
        
    }
}

struct DiceSection_Previews: PreviewProvider {
    static var previews: some View {
        //filled with test data
        DiceSection(symbol: "square.fill", sides: 6)
    }
}
