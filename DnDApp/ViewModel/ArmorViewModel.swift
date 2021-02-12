
import Foundation
import Firebase
import Combine

class ArmorViewModel: ObservableObject, Identifiable {
    @Published var armor: Armor
    @Published var armorRepo = ArmorRepository()

    var id = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init(armor: Armor = Armor(name: "", cost: 0, weight: 0, ac: 0, type: "", magic: false, description: "")){
        self.armor = armor
        
        $armor
            .compactMap { armor in
                armor.id
            }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
    
    func addArmor(){
        armorRepo.addArmor(armor)
    }
    
    func updateArmor(){
        armorRepo.updateArmor(armor)
    }
    
    func deleteArmor(){
        armorRepo.deleteArmor(armor)
    }
}
