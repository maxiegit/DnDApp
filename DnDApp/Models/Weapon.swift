
import Foundation
import FirebaseFirestoreSwift

struct Weapon: Codable, Identifiable, Hashable{
    @DocumentID var id: String?
    var name: String
    var cost: Int
    var weight: Int
    var damage: String
    var type: String
    var martial: Bool
    var magic: Bool
    var descriptors: [String]
    var description: String
    var userID: String?
}
