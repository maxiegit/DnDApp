import Foundation

struct Probability: Codable {
    var target: Int
    var dieNum: Int
    var dieSides:Int
    var bonus: Int
    var calculation: Decimal
}
