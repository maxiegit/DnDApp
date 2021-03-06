import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class ItemRepository: ObservableObject {

    // set db for use
    let db = Firestore.firestore()

    @Published var items = [Item]()

    init() {
        loadData()
    }

    // grabs all the data from the spell collection
    func loadData() {

        guard let userID = Auth.auth().currentUser?.uid else {
            print("error: no user ID")
            return
        }

        db.collection("items").order(by: "name").whereField("userID", isEqualTo: userID).addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.items = querySnapshot.documents.compactMap {document in
                    do {
                        let x = try document.data(as: Item.self)
                        return x
                    } catch {
                        print(error)
                    }
                    return nil
                }
            }
        }
    }

    func addItem(_ item: Item) {
        var addedItem = item
        addedItem.userID = Auth.auth().currentUser?.uid

        do {
            _ = try db.collection("items").addDocument(from: addedItem)
        } catch {
            fatalError("Unable to encode task: \(error.localizedDescription)")
        }
    }

    func updateItem(_ item: Item) {
        if let documentId = item.id {
            do {
                try db.collection("items").document(documentId).setData(from: item)
            } catch {
                fatalError("Unable to encode task: \(error.localizedDescription)")
            }
        }
    }

    func deleteItem(_ item: Item) {
        if let itemID = item.id {
            db.collection("items").document(itemID).delete { (error) in
                if let error = error {
                    print("Error removing document: \(error.localizedDescription)")
                }
            }
        }
    }
}
