import Foundation


//Function for making API call
class Webservice{
    
    // Function for generating the api respone for dice rolling.
    func getRoll(completion: @escaping ([Dice]?) -> ()){
        
        // For URL: nbde = the number of dice to be rolled; tpde = the numbe of sides the dice has
        guard let url = URL(string: "https://www.dejete.com/api?nbde=5&tpde=8") else { fatalError("Invalid Url") }
        print("Url grabbed")
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
    
    // Uses the getRoll func to generate and add roll values
    func addValue(rollerListVm: RollerListViewModel) -> Int{
        var result = 0
        
        rollerListVm.roll()
        
        print("ok ", rollerListVm.dice)
        for dice in rollerListVm.dice{
            result += dice.value
            print(dice)
            print(result)
        }

        print("2")
        return result
    }
}
