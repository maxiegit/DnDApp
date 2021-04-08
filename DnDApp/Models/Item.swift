import Foundation
import FirebaseFirestoreSwift

//Create the item model
struct Item: Codable, Identifiable, Hashable{
    @DocumentID var id: String?
    var name: String
    var cost: Int
    var weight: Int
    var description: String
}

//test data
#if DEBUG

#endif
