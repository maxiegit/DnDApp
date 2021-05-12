import XCTest
@testable import DnDApp

class DnDAppTests: XCTestCase {

    var itemVM: ItemViewModel!
    var rollerVM: RollerListViewModel!
    
    override func setUpWithError() throws {
        self.itemVM = ItemViewModel()
        self.rollerVM = RollerListViewModel()
    }

    override func tearDownWithError() throws {
        self.itemVM = nil
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
    
    func testProbabilityBonus() throws {
        // Given
        let prob = ProbabilityViewModel(probability: Probability(target: 5, dieNum: 1, dieSides: 10, bonus: 2, calculation: 0))
        
        // When
        prob.calculate(prob: prob)
        
        // Then
        XCTAssertEqual(prob.probability.calculation, 80)
    }

    func testDatabase() throws {
        XCTFail()
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
