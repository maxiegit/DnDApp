
import Foundation
import FirebaseFirestoreSwift

struct Armor: Codable, Identifiable, Hashable{
    @DocumentID var id: String?
    var name: String
    var cost: Int
    var weight: Int
    var ac: Int
    var type: String
    var magic: Bool
    var description: String
    var userID: String?
}
