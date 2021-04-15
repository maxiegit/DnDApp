import Foundation
import Firebase
import Combine

class SpellViewModel: ObservableObject, Identifiable {
    @Published var spell: Spell
    @Published var spellRepo = SpellRepository()

    var id = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init(spell: Spell = Spell(name: "", level: 0, school: "", castTime: "", range: "", components: "", duration: "", description: "", ritual: false)){
        self.spell = spell
        
        $spell
            .compactMap { spell in
                spell.id
            }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
    
    func addSpell(){
        spellRepo.addSpell(spell)
    }
    
    func updateSpell(){
        spellRepo.updateSpell(spell)
    }
    
    func deleteSpell(){
        spellRepo.deleteSpell(spell)
    }
}
