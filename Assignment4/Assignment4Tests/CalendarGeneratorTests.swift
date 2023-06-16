import XCTest
@testable import Assignment4

final class CalendarGeneratorTests: XCTestCase {
  
  // Your tests go here
    func testCalendarMay2023() throws {
      let components = DateComponents(year: 2023, month: 5)
      let result = try CalendarGenerator().generate(yearAndMonth: components)
      XCTAssertEqual([[30, 1, 2, 3, 4, 5, 6], [7, 8, 9, 10, 11, 12, 13], [14, 15, 16, 17, 18, 19, 20], [21, 22, 23, 24, 25, 26, 27], [28, 29, 30, 31, 1, 2, 3], [4, 5, 6, 7, 8, 9, 10]], result)
    }
    
    func testCalendarJanuary2022() throws {
            let components = DateComponents(year: 2022, month: 1)
            let result = try CalendarGenerator().generate(yearAndMonth: components)
            XCTAssertEqual([[26, 27, 28, 29, 30, 31, 1], [2, 3, 4, 5, 6, 7, 8], [9, 10, 11, 12, 13, 14, 15], [16, 17, 18, 19, 20, 21, 22], [23, 24, 25, 26, 27, 28, 29], [30, 31, 1, 2, 3, 4, 5]], result)
        }

    func testCalendarSeptember2025() throws {
        let components = DateComponents(year: 2025, month: 9)
        let result = try CalendarGenerator().generate(yearAndMonth: components)
        XCTAssertEqual(result, [[31, 1, 2, 3, 4, 5, 6], [7, 8, 9, 10, 11, 12, 13], [14, 15, 16, 17, 18, 19, 20], [21, 22, 23, 24, 25, 26, 27], [28, 29, 30, 1, 2, 3, 4], [5, 6, 7, 8, 9, 10, 11]])
    }


    func testStartOnSunday() throws {
        let components = DateComponents(year: 2023, month: 1)
        let result = try CalendarGenerator().generate(yearAndMonth: components)
        let expected = [[1, 2, 3, 4, 5, 6, 7], [8, 9, 10, 11, 12, 13, 14], [15, 16, 17, 18, 19, 20, 21], [22, 23, 24, 25, 26, 27, 28], [29, 30, 31, 1, 2, 3, 4], [5, 6, 7, 8, 9, 10, 11]]
            XCTAssertEqual(expected, result)
    }
}
