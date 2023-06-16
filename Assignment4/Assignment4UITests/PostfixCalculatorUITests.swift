import XCTest

final class PostfixCaculatorUITests: XCTestCase {
    
    private var app: XCUIApplication!

    override func setUpWithError() throws {
      try super.setUpWithError()
      continueAfterFailure = true
      app = XCUIApplication()
      app.launch()
    }
  
    private func evaluate(_ expression: String, _ expected: String) throws {
      let field = app.textFields["Expression"]
      field.tap()
      field.typeText(expression)
      app.buttons["Evaluate"].tap()
      let result = app.textFields["Result"]
      XCTAssertEqual(result.value as! String, expected.description, "Incorrect")
    }
    
    private func evaluatenobutton(_ expression: String, _ expected: String) throws {
      let field = app.textFields["Expression"]
      field.tap()
      field.typeText(expression)
      let result = app.textFields["Result"]
      XCTAssertEqual(result.value as! String, expected.description, "Incorrect")
    }
    
    private func clear(_ expression: String) throws {
      let field = app.textFields["Expression"]
      field.tap()
      field.typeText(expression)
      app.buttons["Clear"].tap()
      let result = app.textFields["Result"]
      //print(result.value as! String)
      XCTAssertEqual(result.value as! String, "Result", "Incorrect")
    }

    func testValidExpression() throws {
      try evaluate("2 3.2 +", "5.2")
    }
    
    func testValidExpressionNoButton() throws {
      try evaluatenobutton("2 3.2 +\n", "5.2")
    }
    
    func testClearExpression() throws {
      try clear("2 3.2 +")
    }
    
    
    func testInvalidExpression() throws {
      try evaluate("2 3.2 !", "Error!")
    }
  
}
