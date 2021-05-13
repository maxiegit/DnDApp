import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class ArmorRepository: ObservableObject {

    // set db for use
    let db = Firestore.firestore()

    @Published var armor = [Armor]()

    init() {
        loadData()
    }

    // grabs all the data from the armor collection
    func loadData() {
        guard let userID = Auth.auth().currentUser?.uid else {
            print("error: no user ID")
            return
        }
        db.collection("armor").order(by: "name").whereField("userID", isEqualTo: userID).addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.armor = querySnapshot.documents.compactMap {document in
                    do {
                        let x = try document.data(as: Armor.self)
                        return x
                    } catch {
                        print(error)
                    }
                    return nil
                }
            }
        }
    }

    func addArmor(_ armor: Armor) {
        var addedArmor = armor
        addedArmor.userID = Auth.auth().currentUser?.uid

        do {
           _ = try db.collection("armor").addDocument(from: addedArmor)
        } catch {
            fatalError("Unable to encode task: \(error.localizedDescription)")
        }
    }

    func updateArmor(_ armor: Armor) {
        if let documentId = armor.id {
            do {
                try db.collection("armor").document(documentId).setData(from: armor)
            } catch {
                fatalError("Unable to encode task: \(error.localizedDescription)")
            }
        }
    }

    func deleteArmor(_ armor: Armor) {
        if let armorID = armor.id {
            db.collection("armor").document(armorID).delete { (error) in
                if let error = error {
                    print("Error removing document: \(error.localizedDescription)")
                }
            }
        }
    }
}
