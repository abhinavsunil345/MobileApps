import XCTest
@testable import Assignment4

final class PostfixCalculatorTests: XCTestCase {
  
  // Your tests go here
    func testSimpleAddition() throws {
      let result = try PostfixCalculator().parse(expression: "1 1 + 1 +")
      XCTAssertEqual(3.0, result)
    }
    func testSimpleSubtraction() throws {
      let result = try PostfixCalculator().parse(expression: "1 1 -")
      XCTAssertEqual(0.0, result)
    }
    func testSimpleMultiplication() throws {
      let result = try PostfixCalculator().parse(expression: "3 4 *")
      XCTAssertEqual(12.0, result)
    }
    func testSimpleDivision() throws {
      let result = try PostfixCalculator().parse(expression: "15 3 /")
      XCTAssertEqual(5.0, result)
    }
    func testBasicPower() throws {
      let result = try PostfixCalculator().parse(expression: "3 3 ^")
      XCTAssertEqual(27.0, result)
    }
    func testDecAdd() throws {
      let result = try PostfixCalculator().parse(expression: "3.3 3.4 +")
        XCTAssertEqual(6.7, result, accuracy: 0.0001)
    }
    func testComplexParse() throws {
      let result = try PostfixCalculator().parse(expression: "5 6 2 ^ 2 - *")
      XCTAssertEqual(170, result)
    }
    func testComplexParse2() throws {
      let result = try PostfixCalculator().parse(expression: "2 3 4 * ^ 5 / 6 7 + *")
      XCTAssertEqual(10649.6, result)
    }
    func testNegativeMult() throws {
      let result = try PostfixCalculator().parse(expression: "-2 4 *")
        XCTAssertEqual(-8.0, result)
    }
    func testDecimalCalc() throws {
      let result = try PostfixCalculator().parse(expression: "2.5 2.4 + 1.1 +")
      XCTAssertEqual(6.0, result)
    }
    func testInvalidExpression() throws {
      do {
        let _ = try PostfixCalculator().parse(expression: "2 3")
        XCTFail("Expecting error")
      } catch PostfixCalculatorError.invalidExpression {
      }
    }
    func testUnrecognizedOperator() throws {
      do {
        let _ = try PostfixCalculator().parse(expression: "2 3 $")
        XCTFail("Expecting error")
      } catch PostfixCalculatorError.invalidOperator {
      }
    }
    
    func testInvalidFormat1() throws {
      do {
        let _ = try PostfixCalculator().parse(expression: "2 + 3")
        XCTFail("Expecting error")
      } catch PostfixCalculatorError.invalidFormat{
      }
    }
    
    
    func testInvalidFormat12() throws {
      do {
        let _ = try PostfixCalculator().parse(expression: "2 - 3")
        XCTFail("Expecting error")
      } catch PostfixCalculatorError.invalidFormat {
      }
    }
    
    func testInvalidFormat13() throws {
      do {
        let _ = try PostfixCalculator().parse(expression: "2 * 3")
        XCTFail("Expecting error")
      } catch PostfixCalculatorError.invalidFormat {
      }
    }
    
    func testInvalidFormat14() throws {
      do {
        let _ = try PostfixCalculator().parse(expression: "2 / 3")
        XCTFail("Expecting error")
      } catch PostfixCalculatorError.invalidFormat {
      }
    }
    
    func testInvalidFormat15() throws {
      do {
        let _ = try PostfixCalculator().parse(expression: "2 / 3")
        XCTFail("Expecting error")
      } catch PostfixCalculatorError.invalidFormat {
      }
    }
    
    func testInvalidFormat16() throws {
      do {
        let _ = try PostfixCalculator().parse(expression: "2 ^ 3")
        XCTFail("Expecting error")
      } catch PostfixCalculatorError.invalidFormat {
      }
    }
    
   

  
}

/*
 @Test
 internal fun `integer addition`() {
 assertEquals(3.0, PostfixCalculator().parse("1 1 + 1 +"))
 }
 @Test
 internal fun `integer subtraction`() {
 assertEquals(0.0, PostfixCalculator().parse("1 1 -"))
 }
 @Test
 internal fun `integer multiplication`() {
 assertEquals(12.0, PostfixCalculator().parse("3 4 *"))
 }
 @Test
 internal fun `integer division`() {
 assertEquals(5.0, PostfixCalculator().parse("15 3 /"))
 }
 @Test
 internal fun `Basic Power`() {
 assertEquals(27.0, PostfixCalculator().parse("3 3 ^"))
 }
 @Test
 internal fun `Add Exponents`() {
 assertEquals(6.7, PostfixCalculator().parse("3.4 3.3 +"), 0.001)
 }
 @Test
 internal fun `Complex Parse`() {
 assertEquals(170.0, PostfixCalculator().parse("5 6 2 ^ 2 - *"), 0.001)
 }
 @Test
 internal fun `Complex Parse2`() {
 assertEquals(10649.6, PostfixCalculator().parse("2 3 4 * ^ 5 / 6 7 + *"), 0.001)
 }
 // Chat GPT Generated Tests
 
 @Test
 internal fun `Negative Number Calculation`() {
 assertEquals(-8.0, PostfixCalculator().parse("-2 4 *"), 0.001)
 }
 
 @Test
 internal fun `Decimal Calculation`() {
 assertEquals(6.0, PostfixCalculator().parse("2.5 2.4 + 1.1 +"), 0.001)
 }
 
 @Test
 internal fun `Division by Zero`() {
 assertEquals(POSITIVE_INFINITY, PostfixCalculator().parse("5 0 /"), 0.001)
 }
 
 @Test
 internal fun `Unrecognized Operator`() {
 assertThrows<IllegalArgumentException> { PostfixCalculator().parse("2 3 $") }
 }
 
 @Test
 internal fun `More Numbers than Operands` () {
 assertThrows<IllegalArgumentException> { PostfixCalculator().parse("2 3 3 +") }
 }
 
 /* @Test
  internal fun `Invalid Format`() {
  fail("Is said write some real tests!")
  }*/
 */
