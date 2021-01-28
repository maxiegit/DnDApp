import Foundation
import Combine

class DatabaseListViewModel: ObservableObject{
    @Published var spellRepo = SpellRepository()
    @Published var itemRepo = ItemRepository()
    @Published var spellViewModel = [SpellViewModel]()
    @Published var itemViewModel = [ItemViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        loadSpells()
        loadItems()
    }
    
    func loadItems(){
        itemRepo.$items.map { items in
            items.map{item in
                ItemViewModel(item: item)
                
            }
        }
        .assign(to: \.itemViewModel, on: self)
        .store(in: &cancellables)
    }
    
    func loadSpells(){
        spellRepo.$spells.map { spells in
            spells.map{spell in
                SpellViewModel(spell: spell)
                
            }
        }
        .assign(to: \.spellViewModel, on: self)
        .store(in: &cancellables)
    }
    

    

}
