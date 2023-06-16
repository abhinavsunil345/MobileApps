/*
 * Copyright (C) 2022-2023 David C. Harrison. All right reserved.
 *
 * You may not use, distribute, publish, or modify this code without
 * the express written permission of the copyright holder.
 */

/*
 * The grading system does not simply check the pass/fail of these test; it also
 * checks the contents of the database after each excution to ensure correct
 * functionality.
 */

import XCTest

final class AdvancedUITests: XCTestCase {
    
    static private var email = "aksunil@ucsc.edu"
    static private var passwd = "1921683"
    
    static private var Willemail = "will@cse118.com"
    static private var Willpasswd = "will"

    private var app: XCUIApplication!

    override func setUpWithError() throws {
      try super.setUpWithError()
      continueAfterFailure = false
      app = XCUIApplication()
      app.launchEnvironment = ["animations": "0"]
      app.launch()
    }
    
    private func waitFor(_ element : XCUIElement, timeout: Double = 5.0) -> XCUIElement {
      let expectation = expectation(
        for: NSPredicate(format: "exists == true"),
        evaluatedWith: element,
        handler: .none
      )
      let _ = XCTWaiter.wait(for: [expectation], timeout: timeout)
      return element
    }
            
    private func login(_ email: String = email, _ passwd: String = passwd) {
      let field = app.textFields["EMail"]
      field.tap()
      for char in email {
        field.typeText(String(char))
      }
      let password = app.secureTextFields["Password"]
      password.tap()
      for char in passwd {
        password.typeText(String(char))
      }
      app.buttons["Login"].tap()
    }
    
    
    private func loginReverse(_ email: String = email, _ passwd: String = passwd) {
        
        let password = app.secureTextFields["Password"]
        password.tap()
        for char in passwd {
          password.typeText(String(char))
        }
        
      let field = app.textFields["EMail"]
      field.tap()
      for char in email {
        field.typeText(String(char))
      }
      app.buttons["Login"].tap()
    }
    
    
    private func willlogin(_ email: String = Willemail, _ passwd: String = Willpasswd) {
      let field = app.textFields["EMail"]
      field.tap()
      for char in email {
        field.typeText(String(char))
      }
      let password = app.secureTextFields["Password"]
      password.tap()
      for char in passwd {
        password.typeText(String(char))
      }
      app.buttons["Login"].tap()
    }
    
    
    private func studentWorkspace() {
      login()
      waitFor(app.collectionViews.buttons["Student Workspace"]).tap()
    }
    
    
    private func addWorkspace(_ content: String) {
      login()
      app.navigationBars["Workspaces"].buttons["New Workspace"].tap()
      let workspace = app.textViews["Name"]
      workspace.tap()
      workspace.typeText(content)
      app.buttons["OK"].tap()
      XCTAssert(app.collectionViews.buttons[content].waitForExistence(timeout: 5))
    }
    
    private func addChannel(_ content: String) {
      studentWorkspace()
      app.navigationBars["Student Workspace"].buttons["New Channel"].tap()
      let workspace = app.textViews["Name"]
      workspace.tap()
      workspace.typeText(content)
      app.buttons["OK"].tap()
      XCTAssert(app.collectionViews.buttons[content].waitForExistence(timeout: 5))
    }
    
    
    
    private func cancelAddChannel(_ content: String) {
      studentWorkspace()
      app.navigationBars["Student Workspace"].buttons["New Channel"].tap()
      let workspace = app.textViews["Name"]
      workspace.tap()
      workspace.typeText(content)
        app.buttons["Cancel"].tap()
          XCTAssert(waitFor(app.navigationBars["Student Workspace"]).exists)
    }
    
    
    private func cancelAddWorkspace(_ content: String) {
      login()
      app.navigationBars["Workspaces"].buttons["New Workspace"].tap()
      let workspace = app.textViews["Name"]
      workspace.tap()
      workspace.typeText(content)
      app.buttons["Cancel"].tap()
        XCTAssert(waitFor(app.navigationBars["Workspaces"]).exists)
    }
    
    
    func testLoginFailureNothing() throws {
    app.buttons["Login"].tap()
      XCTAssertFalse(app.navigationBars["Workspaces"].exists)
      XCTAssert(app.buttons["Login"].exists)
    }
    
    func testLoginReverse() throws {
      loginReverse()
      XCTAssert(waitFor(app.navigationBars["Workspaces"]).exists)
    }
    
    
  // Each comment block defines a test you need to write, but you can write others
  
  /*
   * Log in
   * Add a workspace
   * Assert workspace exists
   */
    
  
    func testAddWorkspace() throws {
      let content = "New Workspace"
      addWorkspace(content)
      // Added, so attempt to delete without assertion
      let element = app.staticTexts[content]
      if element.exists {
          element.swipeLeft()
        let button = app.buttons["Delete"]
        if button.exists {
          button.tap()
        }
      }
    }
    
    
    
    
  /*
   * Log in
   * Add a workspace
   * Press reset
   * Assert workspace no longer exists
   */
    
    func testResetAddWorkspace() throws {
      let content = "New Workspace"
      addWorkspace(content)
      // Added, so attempt to delete without assertion
      let button = app.buttons["Reset"]
      button.tap()
        XCTAssertFalse(app.collectionViews.buttons[content].waitForExistence(timeout: 5))
        }
  
  /*
   * Log in
   * Start to add a workspace
   * Cancel
   */
  
    func testCancelAddWorkspace() throws {
      let content = "New Workspace"
      cancelAddWorkspace(content)
      // Added, so attempt to delete without assertion
       XCTAssertFalse(app.collectionViews.buttons[content].waitForExistence(timeout: 5))
    }
    
    
    
    
    
  /*
   * Log in
   * Add a workspace
   * Assert workspace exists
   * Delete the workspace
   * Assert workspace does not exist
   */
    
    
    
    func testDeleteWorkspace() throws {
      let content = "New Workspace"
      addWorkspace(content)
      // Added, so attempt to delete without assertion
      let element = app.staticTexts[content]
      if element.exists {
          element.swipeLeft()
        let button = app.buttons["Delete"]
        if button.exists {
          button.tap()
        }
      }
        XCTAssertFalse(app.collectionViews.buttons[content].waitForExistence(timeout: 5))
    }
  
  /*
   * Log in
   * Select a workspace
   * Add a channel
   * Assert channel exists
   */
  
    
    func testAddChannel() throws {
      let content = "New Channelewbfkwe"
      addChannel(content)
      // Added, so attempt to delete without assertion
      let element = app.staticTexts[content]
      if element.exists {
          element.swipeLeft()
        let button = app.buttons["Delete"]
        if button.exists {
          button.tap()
        }
      }
    }
    
    
    
  /*
   * Log in
   * Select a workspace
   * Start to add a channel
   * Cancel
   */
    
    func testCancelAddChannel() throws {
      let content = "New Channeladweaf"
      cancelAddChannel(content)
      // Added, so attempt to delete without assertion
       XCTAssertFalse(app.collectionViews.buttons[content].waitForExistence(timeout: 5))
    }
  
  /*
   * Log in
   * Select a workspace
   * Add a channel
   * Assert channel exists
   * Delete the channel
   * Assert channel does not exist
   */
    
    func testDeleteChannel() throws {
      let content = "New Chaneodflkmdflm"
      addChannel(content)
      // Added, so attempt to delete without assertion
      let element = app.staticTexts[content]
      if element.exists {
          element.swipeLeft()
        let button = app.buttons["Delete"]
        if button.exists {
          button.tap()
        }
      }
        XCTAssertFalse(app.collectionViews.buttons[content].waitForExistence(timeout: 5))
    }
  
  /*
   * Log in
   * Add a workspace
   * Select the workspace
   * Add Molly Member and Anna Admin as members
   * Assert Molly and Anna are members of the workspace
   */
    
    
    private func addMember(_ content: String) {
        waitFor(app.collectionViews.buttons[content]).tap()
        XCTAssert(app.navigationBars[content].buttons["Add Members"].waitForExistence(timeout: 5))
        app.navigationBars[content].buttons["Add Members"].tap()
        XCTAssert(app.navigationBars["Members"].buttons["Add Member"].waitForExistence(timeout: 5))
        app.navigationBars["Members"].buttons["Add Member"].tap()
        XCTAssert(app.navigationBars["Members"].waitForExistence(timeout: 5))
        let element = app.staticTexts["Anna Admin"]
        if element.exists {
            element.swipeLeft()
            let button = app.buttons["Add"]
            if button.exists {
                button.tap()
            }
        }
        while !app.staticTexts["Molly Member"].exists {
            app.swipeUp()
        }
        let element2 = app.staticTexts["Molly Member"]
        if element2.exists {
            element2.swipeLeft()
            let button2 = app.buttons["Add"]
            if button2.exists {
                button2.tap()
            }
        }
        app.navigationBars.buttons.element(boundBy: 0).tap()
        
    }
    
        
    
    func testAddWorkspaceMember() throws {
      let content = "New WorkspaceMem"
      addWorkspace(content)
      // Added, so attempt to delete without assertion
     addMember(content)
        XCTAssert(app.staticTexts["Anna Admin"].exists)
        XCTAssert(app.staticTexts["Molly Member"].exists)
        app.navigationBars.buttons.element(boundBy: 0).tap()
        app.navigationBars.buttons.element(boundBy: 0).tap()
        let button = app.buttons["Reset"]
        button.tap()
          XCTAssertFalse(app.collectionViews.buttons[content].waitForExistence(timeout: 5))
    }
    
    
    
  
  /*
   * Log in
   * Add a workspace
   * Select the workspaca
   * Add William Shakespeare as a member
   * Assert Will is a member of the workspace
   * Remove Will as a member
   * Assert Will is no longer a member of the workspace
   */
    
    
    private func addWilliam(_ content: String) {
        waitFor(app.collectionViews.buttons[content]).tap()
        XCTAssert(app.navigationBars[content].buttons["Add Members"].waitForExistence(timeout: 5))
        app.navigationBars[content].buttons["Add Members"].tap()
        XCTAssert(app.navigationBars["Members"].buttons["Add Member"].waitForExistence(timeout: 5))
        app.navigationBars["Members"].buttons["Add Member"].tap()
        XCTAssert(app.navigationBars["Members"].waitForExistence(timeout: 5))
        while !app.staticTexts["William Shakespeare"].exists {
            app.swipeUp()
        }
        let element2 = app.staticTexts["William Shakespeare"]
        if element2.exists {
            element2.swipeLeft()
            let button2 = app.buttons["Add"]
            if button2.exists {
                button2.tap()
            }
        }
        app.navigationBars.buttons.element(boundBy: 0).tap()
        
    }
    
    
    func testAddDeleteMember() throws {
      let content = "New WorkspaceMem3"
      addWorkspace(content)
      // Added, so attempt to delete without assertion
     addWilliam(content)
        XCTAssert(app.staticTexts["William Shakespeare"].waitForExistence(timeout: 5))
        let element2 = app.staticTexts["William Shakespeare"]
        if element2.exists {
            element2.swipeLeft()
            let button2 = app.buttons["Delete"]
            if button2.exists {
                button2.tap()
            }
        }
        XCTAssertFalse(app.staticTexts["William Shakespeare"].waitForExistence(timeout: 5))
        app.navigationBars.buttons.element(boundBy: 0).tap()
        app.navigationBars.buttons.element(boundBy: 0).tap()
        
        let element = app.staticTexts[content]
        if element.exists {
            element.swipeLeft()
          let button = app.buttons["Delete"]
          if button.exists {
            button.tap()
          }
        }
          XCTAssertFalse(app.collectionViews.buttons[content].waitForExistence(timeout: 5))
    }
  
  /*
   * Log in
   * Add a workspace
   * Select the workspace
   * Add William Shakespeare as a member
   * Log out
   * Log in as will@cse118.com password "will"
   * Assert workspace is visiable
   */
//    func testAddWilliamWorkspace() throws {
//      let content = "New WorkspaceMem3"
//      addWorkspace(content)
//      // Added, so attempt to delete without assertion
//     addWilliam(content)
//        XCTAssert(app.staticTexts["William Shakespeare"].waitForExistence(timeout: 5))
//        let element2 = app.staticTexts["William Shakespeare"]
//        if element2.exists {
//            element2.swipeLeft()
//            let button2 = app.buttons["Delete"]
//            if button2.exists {
//                button2.tap()
//            }
//        }
//        XCTAssertFalse(app.staticTexts["William Shakespeare"].waitForExistence(timeout: 5))
//        app.navigationBars.buttons.element(boundBy: 0).tap()
//        app.navigationBars.buttons.element(boundBy: 0).tap()
//
//        let element = app.staticTexts[content]
//        if element.exists {
//            element.swipeLeft()
//          let button = app.buttons["Delete"]
//          if button.exists {
//            button.tap()
//          }
//        }
//          XCTAssertFalse(app.collectionViews.buttons[content].waitForExistence(timeout: 5))
//    }
//
    func testAddWilliamWorkspaceLogout() throws {
      let content = "New WorkspaceMem5Abhi"
      addWorkspace(content)
      // Added, so attempt to delete without assertion
      addWilliam(content)
        XCTAssert(app.staticTexts["William Shakespeare"].waitForExistence(timeout: 5))
        app.navigationBars.buttons.element(boundBy: 0).tap()
        app.navigationBars.buttons.element(boundBy: 0).tap()
        app.navigationBars["Workspaces"].buttons["Logout"].tap()
        XCTAssert(app.buttons["Login"].exists)
        willlogin()
        XCTAssert(waitFor(app.collectionViews.buttons[content]).exists)
        
        
        app.navigationBars["Workspaces"].buttons["Logout"].tap()
        XCTAssert(app.buttons["Login"].exists)
        
        login()
        
        let element2 = app.staticTexts[content]
        if element2.exists {
            element2.swipeLeft()
          let button2 = app.buttons["Delete"]
          if button2.exists {
            button2.tap()
          }
        }
        
    }
  
  /*
   * Log in
   * Add a workspace
   * Select the workspace
   * Add William Shakespeare as a member
   * Add a channel
   * Log out
   * Log in as will@cse118.com password "will"
   * Select the workspace
   * Select the channel
   * Add a new message
   * Assert message is visible
   */
    
    func testAddWilliamWorkspaceLogoutMessage() throws {
      let content = "New WorkspaceMem8Abhi"
      let content2 = "NewCHHHHANNEL"
      let content3 = "BOOGGGGOOLO"
      addWorkspace(content)
      // Added, so attempt to delete without assertion
      addWilliam(content)
        XCTAssert(app.staticTexts["William Shakespeare"].waitForExistence(timeout: 5))
        app.navigationBars.buttons.element(boundBy: 0).tap()
        
        app.navigationBars[content].buttons["New Channel"].tap()
        
        let channel = app.textViews["Name"]
        channel.tap()
        channel.typeText(content2)
        app.buttons["OK"].tap()
        XCTAssert(app.staticTexts[content2].waitForExistence(timeout: 5))
        waitFor(app.collectionViews.buttons[content2]).tap()
        app.navigationBars[content2].buttons["New Message"].tap()
        let message = app.textViews["Message"]
        message.tap()
        message.typeText(content3)
        app.buttons["OK"].tap()
        XCTAssert(app.staticTexts[content3].waitForExistence(timeout: 5))
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
        app.navigationBars.buttons.element(boundBy: 0).tap()
        
        app.navigationBars["Workspaces"].buttons["Logout"].tap()
        XCTAssert(app.buttons["Login"].exists)
        willlogin()
        
        XCTAssert(waitFor(app.collectionViews.buttons[content]).exists)
        waitFor(app.collectionViews.buttons[content]).tap()
        XCTAssert(waitFor(app.collectionViews.buttons[content2]).exists)
        waitFor(app.collectionViews.buttons[content2]).tap()
        XCTAssert(app.staticTexts[content3].waitForExistence(timeout: 5))
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
        app.navigationBars.buttons.element(boundBy: 0).tap()
        
        
        app.navigationBars["Workspaces"].buttons["Logout"].tap()
        XCTAssert(app.buttons["Login"].exists)
        
        login()
        
        let element2 = app.staticTexts[content]
        if element2.exists {
            element2.swipeLeft()
          let button2 = app.buttons["Delete"]
          if button2.exists {
            button2.tap()
          }
        }
        
    }
    
  
  /*
   * Log in
   * Add a workspace
   * Select the workspace
   * Add William Shakespeare as a member
   * Add a channel
   * Add a new message
   * Log out
   * Log in as will@cse118.com password "will"
   * Select the workspace
   * Select the channel
   * Assert message cannot be deleted
   */
    
    
    func testAddWilliamWorkspaceLogoutMessageDelete() throws {
      let content = "New WorkspaceMem9Abhi"
      let content2 = "NewCHHHHANNEL"
      let content3 = "BOOGGGGOOLO"
      addWorkspace(content)
      // Added, so attempt to delete without assertion
      addWilliam(content)
        XCTAssert(app.staticTexts["William Shakespeare"].waitForExistence(timeout: 5))
        app.navigationBars.buttons.element(boundBy: 0).tap()
        
        app.navigationBars[content].buttons["New Channel"].tap()
        
        let channel = app.textViews["Name"]
        channel.tap()
        channel.typeText(content2)
        app.buttons["OK"].tap()
        XCTAssert(app.staticTexts[content2].waitForExistence(timeout: 5))
        waitFor(app.collectionViews.buttons[content2]).tap()
        app.navigationBars[content2].buttons["New Message"].tap()
        let message = app.textViews["Message"]
        message.tap()
        message.typeText(content3)
        app.buttons["OK"].tap()
        XCTAssert(app.staticTexts[content3].waitForExistence(timeout: 5))
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
        app.navigationBars.buttons.element(boundBy: 0).tap()
        
        app.navigationBars["Workspaces"].buttons["Logout"].tap()
        XCTAssert(app.buttons["Login"].exists)
        willlogin()
        
        XCTAssert(waitFor(app.collectionViews.buttons[content]).exists)
        waitFor(app.collectionViews.buttons[content]).tap()
        XCTAssert(waitFor(app.collectionViews.buttons[content2]).exists)
        waitFor(app.collectionViews.buttons[content2]).tap()
        XCTAssert(app.staticTexts[content3].waitForExistence(timeout: 5))
        
        waitFor(app.staticTexts[content3]).swipeLeft()
        XCTAssertFalse(app.buttons["Delete"].exists)
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
        app.navigationBars.buttons.element(boundBy: 0).tap()
        
        
        app.navigationBars["Workspaces"].buttons["Logout"].tap()
        XCTAssert(app.buttons["Login"].exists)
        
        login()
        
        let element2 = app.staticTexts[content]
        if element2.exists {
            element2.swipeLeft()
          let button2 = app.buttons["Delete"]
          if button2.exists {
            button2.tap()
          }
        }
        
    }
  
}
