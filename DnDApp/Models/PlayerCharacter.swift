import Foundation
import FirebaseFirestoreSwift

//Create the character model
struct PlayerCharacter: Codable, Identifiable{
    @DocumentID var id: String?
    var userID: String?
    
    //basic character info
    var name: String
    var race: String
    var classes: String // array to accom multiclassing
    var level: Int
    var exp: Int
    var alignment: String
    var background: String
    
    // misc stats
    var ac: Int
    var hp: Int
    var tempHp: Int
    var speed: Int
    var profBonus: Int // proficiency bonus
    var hitDice: [String]
    var inspo: Bool
    
    //death saving throw
    var dstFailure: [Bool]
    var dstSuccess: [Bool]
    
    // core stats
    var strength: Int
    var dexterity: Int
    var constitution: Int
    var intellignece: Int
    var wisdom: Int
    var charisma: Int
    
    // detailed info
    var personality: String
    var ideals: String
    var bonds: String
    var flaws: String
    
    // Proficicies lists
    var coreProficicies: [Bool]
    var saveProficicies: [Bool]
    var otherProficicies: [String]
    var languageProficicies: [String]
    var armorProficicies: [String]
    
    // inventory
    var items: [Item]
    var weapons: [Weapon]
    var armor: [Armor]
    var cp: Int
    var sp: Int
    var gp: Int
    var ep: Int
    var pp: Int
    
    // abilities
    var attacks: [Attacks]
    var classAbilities: [String]
    var spells: [Spell]
    
    
    // god help me
}

struct Attacks: Codable{
    var name: String
    var bonus: Int
    var damage: String
    var damageType: String
}
//test data
#if DEBUG

#endif
