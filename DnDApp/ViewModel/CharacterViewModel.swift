import Foundation
import Firebase
import Combine

class CharacterViewModel: ObservableObject, Identifiable {
    @Published var character: Character
    @Published var characterRepo = CharacterRepository()

    var id = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init(character: Character = Character(name: "", race: "", classes: "", level: 0, exp: 0, alignment: "", background: "", ac: 0, hp: 0, tempHp: 0, speed: 0, profBonus: 0, hitDice: [], inspo: false, dstFailure: 0, dstSuccess: 0, strength: 0, dexterity: 0, constitution: 0, intellignece: 0, wisdom: 0, charisma: 0, personality: "", ideals: "", bonds: "", flaws: "", coreProficicies: [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false], otherProficicies: [], languageProficicies: [], armorProficicies: [], items: [], weapons: [], armor: [], cp: 0, sp: 0, gp: 0, ep: 0, pp: 0, attacks: [], classAbilities: [], spells: [])){
        self.character = character
        
        $character
            .compactMap { character in
                character.id
            }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
    
    func addCharacter(){
        characterRepo.addCharacter(character)
    }
    
    func updateCharacter(){
        characterRepo.updateCharacter(character)
    }
    
    func deleteCharacter(){
        characterRepo.deleteCharacter(character)
    }
}
