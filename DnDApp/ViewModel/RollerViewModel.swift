import Foundation

struct RollerViewModel{
    
    // struct for the dice objuct recieved form the api to be assigned to
    
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

// side enum
public enum DieSides {
    case four
    case six
    case eight
    case ten
    case twelve
    case twenty
}

class RollerListViewModel: ObservableObject{
    
    @Published var dice = [RollerViewModel]()
    var sideArray = [false, false, false, false, false, false]
    var x = 0
    var diceArray: [RollerViewModel] = []
    
    // the main roll function
    // TODO: there is a bug where its using the previous set of results not the current
    
    func roll(){
        for value in sideArray{
            if value { // check the dice has been selected
                Webservice().getRoll(sides: urlShite(arrPos: x)) { (dice) in
                    if let dice = dice {
                        self.dice = dice.map(RollerViewModel.init) // assign according to struct above
                        self.diceArray.append(contentsOf: self.dice) // add to array to be used
                    }
                }
            }
            x += 1
        }
        x = 0
    }
    
    func addValue(rollerListVm: RollerListViewModel) -> Int{
        var result = 0
        
        rollerListVm.roll()
        
        for dice in diceArray{
            result += dice.value
        }
        diceArray = []
        return result
    }
    
    func urlShite(arrPos: Int) -> String{
        if sideArray[arrPos] == true {
            let value = valueByIndex(index: arrPos)
            return value
        }
        return ""
    }
    
    func valueByIndex(index: Int) -> String{
        switch index {
        case 0:
            return "4"
        case 1:
            return "6"
        case 2:
            return "8"
        case 3:
            return "10"
        case 4:
            return "12"
        case 5:
            return "20"
        default:
            return ""
        }
    }
    
    func rawSidesValue(sides: DieSides) -> String{
        switch sides {
        case .four:
            return "4"
        case .six:
            return "6"
        case .eight:
            return "8"
        case .ten:
            return "10"
        case .twelve:
            return "12"
        case .twenty:
            return "20"
        }
    }
    
    func setArrayBool(sides: DieSides, isToggled: Bool){
        switch sides {
        case .four:
            sideArray[0] = isToggled
        case .six:
            sideArray[1] = isToggled
        case .eight:
            sideArray[2] = isToggled
        case .ten:
            sideArray[3] = isToggled
        case .twelve:
            sideArray[4] = isToggled
        case .twenty:
            sideArray[5] = isToggled
        }
    }
}
