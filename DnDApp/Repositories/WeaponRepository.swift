
import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class WeaponRepository: ObservableObject {
    
    //set db for use
    let db = Firestore.firestore()
    
    @Published var weapon = [Weapon]()
    
    init() {
        loadData()
    }
    
    //grabs all the data from the weapon collection
    func loadData() {
        let userID = Auth.auth().currentUser?.uid

        db.collection("weapon").order(by: "name").whereField("userID", isEqualTo: userID).addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.weapon = querySnapshot.documents.compactMap {document in
                    do {
                        let x = try document.data(as: Weapon.self)
                        return x
                    }
                    catch {
                        print(error)
                    }
                    return nil
                }
            }
        }
    }
    
    func addWeapon(_ weapon: Weapon){
        var addedWeapon = weapon
        addedWeapon.userID = Auth.auth().currentUser?.uid
        
        do{
           let _ = try db.collection("weapon").addDocument(from: addedWeapon)
        }
        catch{
            fatalError("Unable to encode task: \(error.localizedDescription)")
        }
    }
    
    func updateWeapon(_ weapon: Weapon){
        if let documentId = weapon.id{
            do{
                try db.collection("weapon").document(documentId).setData(from: weapon)
            }
            catch{
                fatalError("Unable to encode task: \(error.localizedDescription)")
            }
        }
    }
    
    func deleteWeapon(_ weapon: Weapon){
        if let weaponID = weapon.id{
            db.collection("weapon").document(weaponID).delete() { (error) in
                if let error = error {
                    print("Error removing document: \(error.localizedDescription)")
                }
            }
        }
    }
}
