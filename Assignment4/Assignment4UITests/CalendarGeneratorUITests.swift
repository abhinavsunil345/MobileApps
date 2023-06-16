import XCTest

final class CalendarGeneratorUITests: XCTestCase {
  
  // Your UI tests go here
    private var app: XCUIApplication!

    override func setUpWithError() throws {
      try super.setUpWithError()
      continueAfterFailure = true
      app = XCUIApplication()
      app.launch()
    }
    func testMay23Days() throws {
        let month = app.textFields["Month"]
        for _ in 1...12 {
            if (month.value as! String == "May 2023") {
                break
            }
            app.buttons["Previous"].tap()
        }
        let calendar = app.textViews["Calendar"]
        let expected = "30  1  2  3  4  5  6\n 7  8  9 10 11 12 13\n14 15 16 17 18 19 20\n21 22 23 24 25 26 27\n28 29 30 31  1  2  3\n 4  5  6  7  8  9 10"
        let str1 = calendar.value as! String
        print("Str1: ")
        print(str1)
        print("expected :")
        print(expected)
        let diff = str1.difference(from: expected.description)
        print("diff :")
        print(diff)
        XCTAssertEqual(calendar.value as! String, expected)
        }
    
    func testToday() throws {
        let month = app.textFields["Month"]
        for _ in 1...12 {
            if (month.value as! String == "April 2023") {
                break
            }
            app.buttons["Previous"].tap()
        }
        app.buttons["Today"].tap()
        XCTAssertEqual(month.value as! String, "May 2023")
        let calendar = app.textViews["Calendar"]
        let expected = "30  1  2  3  4  5  6\n 7  8  9 10 11 12 13\n14 15 16 17 18 19 20\n21 22 23 24 25 26 27\n28 29 30 31  1  2  3\n 4  5  6  7  8  9 10"
        let str1 = calendar.value as! String
        print("Str1: ")
        print(str1)
        print("expected :")
        print(expected)
        let diff = str1.difference(from: expected.description)
        print("diff :")
        print(diff)
        XCTAssertEqual(calendar.value as! String, expected)
        }
    
    
    func testPrevButton() throws {
        let month = app.textFields["Month"]
        for _ in 1...12 {
            if (month.value as! String == "April 2023") {
                break
            }
            app.buttons["Previous"].tap()
        }
        let calendar = app.textViews["Calendar"]
        let expected = "26 27 28 29 30 31  1\n 2  3  4  5  6  7  8\n 9 10 11 12 13 14 15\n16 17 18 19 20 21 22\n23 24 25 26 27 28 29\n30  1  2  3  4  5  6"
        let str1 = calendar.value as! String
        print("Str1: ")
        print(str1)
        print("expected :")
        print(expected)
        let diff = str1.difference(from: expected.description)
        print("diff :")
        print(diff)
        XCTAssertEqual(calendar.value as! String, expected)
        }
    
    func testPrevButtonJan() throws {
        let month = app.textFields["Month"]
        for _ in 1...12 {
            if (month.value as! String == "December 2022") {
                break
            }
            app.buttons["Previous"].tap()
        }
        let calendar = app.textViews["Calendar"]
        let expected = "27 28 29 30  1  2  3\n 4  5  6  7  8  9 10\n11 12 13 14 15 16 17\n18 19 20 21 22 23 24\n25 26 27 28 29 30 31\n 1  2  3  4  5  6  7"
        let str1 = calendar.value as! String
        print("Str1: ")
        print(str1)
        print("expected :")
        print(expected)
        let diff = str1.difference(from: expected.description)
        print("diff :")
        print(diff)
        XCTAssertEqual(calendar.value as! String, expected)
        }
    
    func testNextButtonDec() throws {
        let month = app.textFields["Month"]
        for _ in 1...12 {
            if (month.value as! String == "January 2024") {
                break
            }
            app.buttons["Next"].tap()
        }
        let calendar = app.textViews["Calendar"]
        let expected = "31  1  2  3  4  5  6\n 7  8  9 10 11 12 13\n14 15 16 17 18 19 20\n21 22 23 24 25 26 27\n28 29 30 31  1  2  3\n 4  5  6  7  8  9 10"
        let str1 = calendar.value as! String
        print("Str1: ")
        print(str1)
        print("expected :")
        print(expected)
        let diff = str1.difference(from: expected.description)
        print("diff :")
        print(diff)
        XCTAssertEqual(calendar.value as! String, expected)
        }
    
    func testNextButton() throws {
        let month = app.textFields["Month"]
        for _ in 1...12 {
            if (month.value as! String == "June 2023") {
                break
            }
            app.buttons["Next"].tap()
        }
        let calendar = app.textViews["Calendar"]
        let expected = "28 29 30 31  1  2  3\n 4  5  6  7  8  9 10\n11 12 13 14 15 16 17\n18 19 20 21 22 23 24\n25 26 27 28 29 30  1\n 2  3  4  5  6  7  8"
        let str1 = calendar.value as! String
        print("Str1: ")
        print(str1)
        print("expected :")
        print(expected)
        let diff = str1.difference(from: expected.description)
        print("diff :")
        print(diff)
        XCTAssertEqual(calendar.value as! String, expected)
        }
    
}
