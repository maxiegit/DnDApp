import SwiftUI

struct ProbabilityView: View {
    
    @StateObject var prob = ProbabilityViewModel()
    
    var body: some View {
        ZStack{
            Color.flatDarkBackground.ignoresSafeArea()
            VStack(alignment: .center){
                Spacer()
                VStack {
                    Text("Target")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                    Box(probVar: "target", prob: prob)
                }
                Spacer()
                VStack {
                    Text("Dice")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                    HStack{
                        Box(probVar: "dieNum", prob: prob)
                        Text("d")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        Box(probVar: "dieSides", prob: prob)
                    }
                }
                Spacer()
                VStack{
                    Text("Bonus")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Box(probVar: "bonus", prob: prob)
                }
                Spacer()
                VStack{
                    Text("Chance of Success")
                        .font(.title)
                        .foregroundColor(.white)
                    Box(text: "\(prob.probability.calculation)%", textField: false)
                }
                Spacer()
            }
        }
    }
}

struct Probability_Previews: PreviewProvider {
    static var previews: some View {
        ProbabilityView()
    }
}
