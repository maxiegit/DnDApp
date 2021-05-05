import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class CharacterRepository: ObservableObject {
    
    //set db for use
    let db = Firestore.firestore()
    
    @Published var characters = [PlayerCharacter]()
    
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
                        let x = try document.data(as: PlayerCharacter.self)
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
    
    func addCharacter(_ character: PlayerCharacter){
        var addedChar = character
        addedChar.userID = Auth.auth().currentUser?.uid
        
        do{
           let _ = try db.collection("characters").addDocument(from: addedChar)
        }
        catch{
            fatalError("Unable to encode task: \(error.localizedDescription)")
        }
    }
    
    func updateCharacter(_ character: PlayerCharacter){
        if let documentId = character.id{
            do{
                try db.collection("characters").document(documentId).setData(from: character)
            }
            catch{
                fatalError("Unable to encode task: \(error.localizedDescription)")
            }
        }
    }
    
    func deleteCharacter(_ character: PlayerCharacter){
        if let characterID = character.id{
            db.collection("characters").document(characterID).delete() { (error) in
                if let error = error {
                    print("Error removing document: \(error.localizedDescription)")
                }
            }
        }
    }
}
