import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class SpellRepository: ObservableObject {
    
    //set db for use
    let db = Firestore.firestore()
    
    @Published var spells = [Spell]()
    
    init() {
        loadData()
    }
    
    //grabs all the data from the  spell collection
    func loadData() {
        
        let userID = Auth.auth().currentUser?.uid
        
        db.collection("spells").order(by: "name").whereField("userID", isEqualTo: userID).addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.spells = querySnapshot.documents.compactMap {document in
                    do {
                        let x = try document.data(as: Spell.self)
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
    
    func addSpell(_ spell: Spell){
        var addedSpell = spell
        addedSpell.userID = Auth.auth().currentUser?.uid
        
        do{
           let _ = try db.collection("spells").addDocument(from: addedSpell)
        }
        catch{
            fatalError("Unable to encode task: \(error.localizedDescription)")
        }
    }
    
    func updateSpell(_ spell: Spell){
        if let documentId = spell.id{
            do{
                try db.collection("spells").document(documentId).setData(from: spell)
            }
            catch{
                fatalError("Unable to encode task: \(error.localizedDescription)")
            }
        }
    }
    
    func deleteSpell(_ spell: Spell){
        if let spellID = spell.id{
            db.collection("spells").document(spellID).delete() { (error) in
                if let error = error {
                    print("Error removing document: \(error.localizedDescription)")
                }
            }
        }
    }
}
