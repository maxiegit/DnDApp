import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class BackgroundRepository: ObservableObject {
    
    //set db for use
    let db = Firestore.firestore()
    
    @Published var backgrounds = [Background]()
    
    init() {
        loadData()
    }
    
    //grabs all the data from the  background collection
    func loadData() {
        let userID = Auth.auth().currentUser?.uid

        db.collection("backgrounds").order(by: "name").whereField("userID", isEqualTo: userID!).addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.backgrounds = querySnapshot.documents.compactMap {document in
                    do {
                        let x = try document.data(as: Background.self)
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
    
    func addBackground(_ background: Background){
        var addedBackground = background
        addedBackground.userID = Auth.auth().currentUser?.uid
        
        do{
           let _ = try db.collection("backgrounds").addDocument(from: addedBackground)
        }
        catch{
            fatalError("Unable to encode task: \(error.localizedDescription)")
        }
    }
    
    func updateBackground(_ background: Background){
        if let documentId = background.id{
            do{
                try db.collection("backgrounds").document(documentId).setData(from: background)
            }
            catch{
                fatalError("Unable to encode task: \(error.localizedDescription)")
            }
        }
    }
    
    func deleteBackground(_ background: Background){
        if let backgroundID = background.id{
            db.collection("backgrounds").document(backgroundID).delete() { (error) in
                if let error = error {
                    print("Error removing document: \(error.localizedDescription)")
                }
            }
        }
    }
}
