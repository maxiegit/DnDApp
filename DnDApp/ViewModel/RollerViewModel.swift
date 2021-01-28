import Foundation

class RollerViewModel: ObservableObject{
    
    @Published var sides = 2
    
    func setSides(numOfSides: Int){
        sides = numOfSides
    }
    
}
