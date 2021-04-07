import SwiftUI

struct StatBox: View {
    
    var stat: Int
    
    var body: some View {
        ZStack(alignment: .center){
            Color.flatDarkCardBackground
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(radius: 20)

            Text(String(stat))
                .foregroundColor(.white)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)

            Color.flatDarkBackground
                .frame(width:50, height:35)
                .cornerRadius(5)
                .overlay(Text("\(bonusCalc(stat: stat))").foregroundColor(.white))
                .offset(y: 45)
                
        }
    }
    
    func bonusCalc(stat: Int) -> Int {
        let unroundedbonus = ((Double(stat)-10)/2)
        let bonus = Double(unroundedbonus).rounded(.down)
        return Int(bonus)
        
    }
    
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        StatBox(stat: 9)
    }
}
