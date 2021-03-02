import Foundation

struct RollerViewModel{
    
    var dice: Dice
    
    init(dice: Dice) {
        self.dice = dice
    }
    
    var id: Int{
        return self.dice.id
    }
    
    var value: Int{
        return self.dice.value
    }
}

class RollerListViewModel: ObservableObject{
    @Published var dice = [RollerViewModel]()
    
    func roll(){
        Webservice().getRoll { (dice) in
            if let dice = dice {
                self.dice = dice.map(RollerViewModel.init)
                print(dice)

            }
        }
    }
}
