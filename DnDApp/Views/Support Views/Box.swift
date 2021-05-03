import SwiftUI
import Combine

struct Box: View {
    
    var text = ""
    @State var probVar = ""
    @State var num = ""
    @State var textField = true
    @StateObject var prob = ProbabilityViewModel()
    
    var body: some View {
        ZStack(alignment: .center){
            Color.flatDarkCardBackground
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(radius: 20)
            
            VStack {
                if(textField){
                    TextField("0", text: $num)
                        // santise input
                        .keyboardType(.numberPad)
                        .onReceive(Just(num)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.num = filtered
                            }
                        }
                        .onChange(of: num, perform: { value in
                            if(probVar == "target"){
                                prob.probability.target = Int(num) ?? 0
                            }
                            else if (probVar == "dieNum"){
                                prob.probability.dieNum = Int(num) ?? 0
                            }
                            else if (probVar == "dieSides"){
                                prob.probability.dieSides = Int(num) ?? 0
                            }
                            else{
                                prob.probability.bonus = Int(num) ?? 0
                            }
                            prob.calculate(prob: prob)
                        })
                        .fixedSize()
                        .foregroundColor(.white)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .offset(y: 5)
                }
                else{
                    Text(text)
                        .fixedSize()
                        .foregroundColor(.white)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .offset(y: 5)
                }
            }
        }
    }
    
    struct Box_Previews: PreviewProvider {
        static var previews: some View {
            Box()
        }
    }
}
