import XCTest
@testable import DnDApp

class DnDAppTests: XCTestCase {

    var rollerVM: RollerListViewModel!
    var charVM: CharacterViewModel!
    var probVM: ProbabilityViewModel!
    
    override func setUpWithError() throws {
        self.rollerVM = RollerListViewModel()
        self.charVM = CharacterViewModel()
        self.probVM = ProbabilityViewModel()
    }

    override func tearDownWithError() throws {
        self.rollerVM = nil
    }

    func testBonusCalc() throws {
        
        // When
        let bonus = charVM.bonusCalc(stat: 12)
        
        // Then
        XCTAssertEqual(bonus, 1)
    }
    
    func testBonusCalcFail() throws {
        // When
        let bonus = charVM.bonusCalc(stat: 12)
        
        //Then
        XCTAssertNotEqual(bonus, 0)
    }
    
    func testRoller() {
        
        // When
        let result = rollerVM.addValue(rollerListVm: rollerVM)
        
        // Then
        XCTAssertNotNil(result)
    }
    
    func testRollerWithValue() {
        
        //Given
        rollerVM.setArrayBool(sides: .six, isToggled: true)
        
        // When
        let result = rollerVM.addValue(rollerListVm: rollerVM)
        
        // Then
        XCTAssertGreaterThan(result, -1)
    }
        
    func testProbability() throws {
        // Given
        let prob = ProbabilityViewModel(probability: Probability(target: 3, dieNum: 1, dieSides: 10, bonus: 0, calculation: 0))
        
        // When
        prob.calculate(prob: prob)
        
        // Then
        XCTAssertEqual(prob.probability.calculation, 80)
    }
    
    func testProbabilityFail() throws {
        // Given
        let prob = ProbabilityViewModel(probability: Probability(target: 3, dieNum: 1, dieSides: 10, bonus: 0, calculation: 0))
        
        // When
        prob.calculate(prob: prob)
        
        // Then
        XCTAssertNotEqual(prob.probability.calculation, 70)
    }
    
    func testProbabilityZero() throws {
        // Given
        let prob = ProbabilityViewModel(probability: Probability(target: 3, dieNum: 1, dieSides: 0, bonus: 0, calculation: 0))
        
        // When
        prob.calculate(prob: prob)
        
        // Then
        XCTAssertEqual(prob.probability.calculation, 0)
    }
    
    func testProbabilityBonus() throws {
        // Given
        let prob = ProbabilityViewModel(probability: Probability(target: 5, dieNum: 1, dieSides: 10, bonus: 2, calculation: 0))
        
        // When
        prob.calculate(prob: prob)
        
        // Then
        XCTAssertEqual(prob.probability.calculation, 80)
    }
    
    func testProbabilityFactorial() throws {
        
        // Given
        let result = factorial(number: 5.0)
        
        // Then
        XCTAssertEqual(result, 120)
    }
    
    func testProbabilityFactorialFail() throws {
        
        // Given
        let result = factorial(number: 8.0)
        
        // Then
        XCTAssertNotEqual(result, 120)
    }
    
    func testProbabilityFactorialZero() throws {
        
        // Given
        let result = factorial(number: 0)
        
        // Then
        XCTAssertEqual(result, 1)
    }
    
    func testProbabilityFactorialNegative() throws {
        
        // Given
        let result = factorial(number: -12)
        
        // Then
        XCTAssertEqual(result, 1)
    }
    
    func testProbabilityCombSansRepeat() throws {
         // Given
        let result = comb_sans_repeat(n: 3.0, k: 1)
        
        // Then
        XCTAssertEqual(result, 3)
    }
    
    func testProbabilityCombSansRepeatFail() throws {
         // Given
        let result = comb_sans_repeat(n: 3.0, k: 1)
        
        // Then
        XCTAssertNotEqual(result, 0)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
