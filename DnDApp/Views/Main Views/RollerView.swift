import SwiftUI

struct RollerView: View {
    
    //TODO: Finish roller viewmodel, have text fields for number of dice
    
    @ObservedObject var rollerVM: RollerViewModel = RollerViewModel(roller: Roller(sides: 6, amount: 1, modifer: 0))
    
    @State private var result = 0
        
    var body: some View {
        ZStack {
            Color.flatDarkBackground.ignoresSafeArea()
            
            VStack(spacing: 20) {
                HStack(spacing: 20) {
                    DiceSection(symbol: "square.fill", sides: 4)
                    DiceSection(symbol: "square.fill", sides: 6)
                    DiceSection(symbol: "square.fill", sides: 8)
                }
                
                HStack(spacing: 20) {
                    DiceSection(symbol: "square.fill", sides: 10)
                    DiceSection(symbol: "square.fill", sides: 12)
                    DiceSection(symbol: "square.fill", sides: 20)

                }
                
                Text("\(self.result)")
                    .padding(.vertical, 150)
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                
                Button("Roll", action:{
                    rollerVM.roll()
                })
                .frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color.flatDarkCardBackground)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 20)
            }
            .padding(.bottom, 50)
        }
    }
}



struct Roller_Previews: PreviewProvider {
    static var previews: some View {
        RollerView()
    }
}
