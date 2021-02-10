import Foundation

class RollerViewModel: ObservableObject, Identifiable{
    @Published var roller: Roller
    
    init(roller: Roller = Roller(sides: 0, amount: 0, modifer: 0)){
        self.roller = roller
    }
    
    func roll(){
        let url = URL(string: "http://roll.diceapi.com/json/" + String(roller.sides))
        let request = URLRequest(url: url!)
        print(request)
    }
}
