import SwiftUI

struct DiceSection: View {

    let symbol: String
    let sides: DieSides
    var rollerListVm: RollerListViewModel
    @State private var tapped = false

    init(symbol: String, sides: DieSides, rollerListVm: RollerListViewModel) {
        self.symbol = symbol
        self.sides = sides
        self.rollerListVm = rollerListVm
    }

    var body: some View {
        ZStack {
            if tapped {
                Color.blue
                    .frame(width: 100/*@END_MENU_TOKEN@*/, height: 100/*@END_MENU_TOKEN@*/, alignment: .center/*@END_MENU_TOKEN@*/)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 20)
            } else {
                Color.flatDarkCardBackground
                    .frame(width: 100/*@END_MENU_TOKEN@*/, height: 100/*@END_MENU_TOKEN@*/, alignment: .center/*@END_MENU_TOKEN@*/)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 20)
            }

            Image(systemName: symbol)
                .resizable()
                .foregroundColor(.white)
                .frame(width: 50, height: 50, alignment: .center/*@END_MENU_TOKEN@*/)
                .overlay(Text(rollerListVm.rawSidesValue(sides: sides))
                            .fontWeight(.light)
                            .foregroundColor(Color.black))
        }
        .onTapGesture {
            tapped.toggle()
            rollerListVm.setArrayBool(sides: sides, isToggled: tapped)
        }

    }
}

struct DiceSection_Previews: PreviewProvider {
    static var previews: some View {
        // filled with test data
        DiceSection(symbol: "square.fill", sides: .six, rollerListVm: RollerListViewModel())
    }
}
