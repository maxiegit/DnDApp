import Foundation
import Firebase
import Combine

class WeaponViewModel: ObservableObject, Identifiable {
    @Published var weapon: Weapon
    @Published var weaponRepo = WeaponRepository()

    var id = ""

    private var cancellables = Set<AnyCancellable>()

    init(weapon: Weapon = Weapon(name: "", cost: 0, weight: 0, damage: "", type: "", martial: false, magic: false, descriptors: [""], description: "")) {
        self.weapon = weapon

        $weapon
            .compactMap { weapon in
                weapon.id
            }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }

    func addWeapon() {
        weaponRepo.addWeapon(weapon)
    }

    func updateWeapon() {
        weaponRepo.updateWeapon(weapon)
    }

    func deleteWeapon() {
        weaponRepo.deleteWeapon(weapon)
    }
}
