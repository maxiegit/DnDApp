import Foundation
import FirebaseFirestoreSwift

struct Background: Codable, Identifiable {
    @DocumentID var id: String?
    var name: String
    var skillProf: [String]
    var toolProf: [String]
    var languages: String
    var equipment: String
    var feature: String
    var ability: String
    var specialty: [String]
    var suggestedPersonality: [String]
    var suggestedIdeal: [String]
    var suggestedBond: [String]
    var suggestedFlaw: [String]
    var userID: String?
}
