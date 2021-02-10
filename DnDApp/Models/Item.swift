import Foundation
import FirebaseFirestoreSwift

//Create the item model
struct Item: Codable, Identifiable{
    @DocumentID var id: String?
    var name: String
    var cost: Int
    var weight: Int
    var description: String
    
    //Later when filling out the databse more, have different options for the type of item (ie weapon, armor, tool etc) and have different options available to the user based on that
}

//test data
#if DEBUG

#endif
