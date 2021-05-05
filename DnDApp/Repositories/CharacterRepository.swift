import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class CharacterRepository: ObservableObject {
    
    //set db for use
    let db = Firestore.firestore()
    
    @Published var characters = [Character]()
    
    init() {
        loadData()
    }
    
    //grabs all the data from the  character collection
    func loadData() {
        
        let userID = Auth.auth().currentUser?.uid

        db.collection("characters").whereField("userID", isEqualTo: userID).addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.characters = querySnapshot.documents.compactMap {document in
                    do {
                        let x = try document.data(as: Character.self)
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
    
    func addCharacter(_ character: Character){
        var addedChar = character
        addedChar.userID = Auth.auth().currentUser?.uid
        
        do{
           let _ = try db.collection("characters").addDocument(from: addedChar)
        }
        catch{
            fatalError("Unable to encode task: \(error.localizedDescription)")
        }
    }
    
    func updateCharacter(_ character: Character){
        if let documentId = character.id{
            do{
                try db.collection("characters").document(documentId).setData(from: character)
            }
            catch{
                fatalError("Unable to encode task: \(error.localizedDescription)")
            }
        }
    }
    
    func deleteCharacter(_ character: Character){
        if let characterID = character.id{
            db.collection("characters").document(characterID).delete() { (error) in
                if let error = error {
                    print("Error removing document: \(error.localizedDescription)")
                }
            }
        }
    }
}
