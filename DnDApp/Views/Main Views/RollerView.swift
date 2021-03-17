import SwiftUI

struct RollerView: View {
    
    //TODO: Finish roller viewmodel, have text fields for number of dice
    
    @ObservedObject var rollerListVm = RollerListViewModel()
    @State private var result = 0
    
    var body: some View {
        ZStack {
            Color.flatDarkBackground.ignoresSafeArea()
            
            VStack(spacing: 20) {
                HStack(spacing: 20) {
                    DiceSection(symbol: "square.fill", sides: .four, rollerListVm: rollerListVm)
                    DiceSection(symbol: "square.fill", sides: .six, rollerListVm: rollerListVm)
                    DiceSection(symbol: "square.fill", sides: .eight, rollerListVm: rollerListVm)
                }
                
                HStack(spacing: 20) {
                    DiceSection(symbol: "square.fill", sides: .ten, rollerListVm: rollerListVm)
                    DiceSection(symbol: "square.fill", sides: .twelve, rollerListVm: rollerListVm)
                    DiceSection(symbol: "square.fill", sides: .twenty, rollerListVm: rollerListVm)
                    
                }
                
                            
                Text("\(result)")
                    .padding(.vertical, 150)
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                
                Button("Roll", action:{
                    result = rollerListVm.addValue(rollerListVm: rollerListVm)
                })
                .frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color.flatDarkCardBackground)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 20)
            }
        }
    }
    
    struct Roller_Previews: PreviewProvider {
        static var previews: some View {
            RollerView()
        }
    }
}

