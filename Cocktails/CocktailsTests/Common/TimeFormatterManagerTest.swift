//
//  TimeFormatterManagerTest.swift
//  CocktailsTests
//
//  Created by Kristina Matijasic on 30.05.2024..
//

import Foundation
import XCTest
@testable import Cocktails

final class TimeFormatterManagerTest: XCTestCase {

    var timeFormatterManager: TimeFormatterManagerInterface!
    var calendar: Calendar!
        
    override func setUp() {
        super.setUp()
        timeFormatterManager = TimeFormatterManager.shared
        calendar = Calendar.current
    }
    
    func testFormattedTimestamp_withNilDate() {
        let result = timeFormatterManager.formattedTimestamp(from: nil)
        XCTAssertEqual(result, "Invalid date")
    }
    
    func testFormattedTimestamp_withInvalidDate() {
        let result = timeFormatterManager.formattedTimestamp(from: "Invalid date")
        XCTAssertEqual(result, "Invalid date")
    }
        
    func testFormattedTimestamp_withTodayDate() {
        let dateString = "2024-05-30 14:42:59"
        let result = timeFormatterManager.formattedTimestamp(from: dateString)
        XCTAssertEqual(result, "Today")
    }
        
    func testFormattedTimestamp_withThisWeekDate() {
        let dateString = "2024-05-28 14:42:59"
        let result = timeFormatterManager.formattedTimestamp(from: dateString)
        XCTAssertEqual(result, "This week")
    }
        
    func testFormattedTimestamp_withThisMonthDate() {
        let dateString = "2024-05-18 14:42:59"
        let result = timeFormatterManager.formattedTimestamp(from: dateString)
        XCTAssertEqual(result, "This month")
    }
        
    func testFormattedTimestamp_withThisYearDate() {
        let dateString = "2024-02-18 14:42:59"
        let result = timeFormatterManager.formattedTimestamp(from: dateString)
        XCTAssertEqual(result, "This year")
    }
        
    func testFormattedTimestamp_withYearsAgoDate() {
        let dateString = "2020-05-30 14:42:59"
        let result = timeFormatterManager.formattedTimestamp(from: dateString)
        XCTAssertEqual(result, "4 years ago")
    }
}
