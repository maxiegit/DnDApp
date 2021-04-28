
import Foundation
import Combine

class DatabaseListViewModel: ObservableObject{
    @Published var spellRepo = SpellRepository()
    @Published var itemRepo = ItemRepository()
    @Published var armorRepo = ArmorRepository()
    @Published var weaponRepo = WeaponRepository()
    @Published var backgroundRepo = BackgroundRepository()
    @Published var characterRepo = CharacterRepository()
    @Published var spellViewModel = [SpellViewModel]()
    @Published var itemViewModel = [ItemViewModel]()
    @Published var armorViewModel = [ArmorViewModel()]
    @Published var weaponViewModel = [WeaponViewModel()]
    @Published var backgroundViewModel = [BackgroundViewModel()]
    @Published var characterViewModel = [CharacterViewModel()]
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        loadSpells()
        loadItems()
        loadArmor()
        loadWeapon()
        loadBackground()
        loadCharacters()
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
    
    func loadArmor(){
        armorRepo.$armor.map { armors in
            armors.map{armor in
                ArmorViewModel(armor: armor)
                
            }
        }
        .assign(to: \.armorViewModel, on: self)
        .store(in: &cancellables)
    }
    
    func loadWeapon(){
        weaponRepo.$weapon.map { weapons in
            weapons.map{weapon in
                WeaponViewModel(weapon: weapon)
                
            }
        }
        .assign(to: \.weaponViewModel, on: self)
        .store(in: &cancellables)
    }
    
    func loadBackground(){
        backgroundRepo.$backgrounds.map { background in
            background.map{background in
                BackgroundViewModel(background: background)
                
            }
        }
        .assign(to: \.backgroundViewModel, on: self)
        .store(in: &cancellables)
    }
    
    func loadCharacters(){
        characterRepo.$characters.map { characters in
            characters.map{character in
                CharacterViewModel(character: character)
                
            }
        }
        .assign(to: \.characterViewModel, on: self)
        .store(in: &cancellables)
    }

}
