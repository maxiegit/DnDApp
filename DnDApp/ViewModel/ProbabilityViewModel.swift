import Foundation

class ProbabilityViewModel: ObservableObject, Identifiable {

    @Published var probability: Probability

    init(probability: Probability = Probability(target: 0, dieNum: 0, dieSides: 0, bonus: 0, calculation: 0.0)) {
        self.probability = probability
    }

    func calculate(prob: ProbabilityViewModel) {
        let n = Double(prob.probability.dieNum)
        let s = Double(prob.probability.dieSides)
        let y = Double(prob.probability.target)

        let k_max = floor((y-n)/s)
        var sum: Decimal = 0.0
        var finalSum: Decimal = 0.0
        let int_max = 0
        let k = 0

        guard !(n.isZero || s.isZero || y.isZero || y > (n*s)) else {
            return
        }

        for _ in Int(y-Double(prob.probability.bonus))...Int((n*s)) {
            sum = 0
            guard !(k_max.isNaN || k_max.isInfinite) else {
                return
            }

            for _ in k...int_max {
                let val1 = pow(-1, k)
                let val2 = comb_sans_repeat(n: n, k: Double(k))
                let val3 = comb_sans_repeat(n: (y-(s*Double(k))-1), k: n-1)
                let val4 = (val1 * Decimal(val2) * Decimal(val3))
                sum = sum + val4
            }

            sum = sum/pow(Decimal(s), Int(n))
            finalSum += sum
        }
        if finalSum > 1 {
            prob.probability.calculation = 100
        } else {
            prob.probability.calculation = finalSum * 100
        }
    }
}

func comb_sans_repeat(n: Double, k: Double) -> Double {
    let res = factorial(number: n)/(factorial(number: k) * factorial(number: n-k))
    return res
}

func factorial(number: Double) -> Double {
    //    print(number)
    guard !(number.isZero || number.isLess(than: 0.0)) else {
        return 1.0
    }

    if number == 0 {
        return 1
    } else {
        return number * factorial(number: number - 1)
    }
}
