import Foundation


//Function for making API call
class Webservice{
    
    // Function for generating the api respone for dice rolling.
    func getRoll(sides: String, completion: @escaping ([Dice]?) -> ()){
        
        // For URL: nbde = the number of dice to be rolled; tpde = the number of sides the dice has
        guard let url = URL(string: "https://www.dejete.com/api?nbde=1&tpde=\(sides)") else { fatalError("Invalid Url") }
        URLSession.shared.dataTask(with: url) { (data, response , error) in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let posts = try? JSONDecoder().decode([Dice].self, from: data)
            
            DispatchQueue.main.async{
                completion(posts)
            }
        }
        .resume()
    }
    

}
