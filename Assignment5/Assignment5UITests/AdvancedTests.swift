//
//  AdvancedTests.swift
//  Assignment5UITests
//
//  Created by Abhinav Sunil on 5/10/23.
//

import XCTest

final class AdvancedTests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testChannelsFields() throws {
      app.staticTexts["Elevator"].tap()
      XCTAssert(app.staticTexts["Painter"].exists)
      let myTextField = app.textFields["members active in Painter"]
      let myTextField2 = app.textFields["count for Painter"]
      let myTextField3 = app.textFields["latest message in Painter"]
      XCTAssertTrue(myTextField.exists)
      XCTAssertTrue(myTextField2.exists)
      XCTAssertTrue(myTextField3.exists)
      XCTAssertEqual(myTextField.value as? String, "3")
      XCTAssertEqual(myTextField2.value as? String, "5")
  //    XCTAssertEqual(myTextField3.value as? String, "22 days")
    }
    
    func testChannelsFieldsSeconds() throws {
        while !app.staticTexts["Test Workspace"].exists {
            app.swipeUp()
        }
        app.staticTexts["Test Workspace"].tap()
     XCTAssert(app.staticTexts["Test Channel"].exists)
        let myTextField = app.textFields["members active in Test Channel"]
        let myTextField2 = app.textFields["count for Test Channel"]
    //    let myTextField3 = app.textFields["latest message in Test Channel"]
       XCTAssertEqual(myTextField.value as? String, "1")
       XCTAssertEqual(myTextField2.value as? String, "3")
    //    XCTAssertTrue((myTextField3.value as? String)?.contains("secs") ?? false)
        

    }
    
    func testChannelsFieldsMinutes() throws {
        while !app.staticTexts["Test Workspace2"].exists {
            app.swipeUp()
        }
        app.staticTexts["Test Workspace2"].tap()
     XCTAssert(app.staticTexts["Test Channel2"].exists)
        let myTextField = app.textFields["members active in Test Channel2"]
        let myTextField2 = app.textFields["count for Test Channel2"]
    //    let myTextField3 = app.textFields["latest message in Test Channel2"]
       XCTAssertEqual(myTextField.value as? String, "1")
       XCTAssertEqual(myTextField2.value as? String, "1")
     //  XCTAssertEqual(myTextField3.value as? String, "20 mins")

    }
    
    func testChannelsFieldsHours() throws {
        while !app.staticTexts["Test Workspace3"].exists {
            app.swipeUp()
        }
        app.staticTexts["Test Workspace3"].tap()
     XCTAssert(app.staticTexts["Test Channel3"].exists)
        let myTextField = app.textFields["members active in Test Channel3"]
        let myTextField2 = app.textFields["count for Test Channel3"]
        let myTextField3 = app.textFields["latest message in Test Channel3"]
       XCTAssertEqual(myTextField.value as? String, "1")
       XCTAssertEqual(myTextField2.value as? String, "1")
       XCTAssertEqual(myTextField3.value as? String, "2 hours")
        

    }
    
    func testChannelsEIFS() throws {
        while !app.staticTexts["EIFS"].exists {
            app.swipeUp()
        }
        app.staticTexts["EIFS"].tap()
     XCTAssert(app.staticTexts["Waterproofer"].exists)
        

    }
    
    func testWorkspaceFieldsHours() throws {
        while !app.staticTexts["Test Workspace3"].exists {
            app.swipeUp()
        }
     XCTAssert(app.staticTexts["Test Workspace3"].exists)
        let myTextField = app.textFields["members active in Test Workspace3"]
        let myTextField2 = app.textFields["count for Test Workspace3"]
        let myTextField3 = app.textFields["latest message in Test Workspace3"]
       XCTAssertEqual(myTextField.value as? String, "1")
       XCTAssertEqual(myTextField2.value as? String, "1")
       XCTAssertEqual(myTextField3.value as? String, "2 hours")
        

    }
    
}
