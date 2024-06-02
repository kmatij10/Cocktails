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
    var today: Date!
    var dateFormatter: DateFormatter!
        
    override func setUp() {
        super.setUp()
        timeFormatterManager = TimeFormatterManager.shared
        calendar = Calendar.current
        today = Date()
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }
    
    func testFormattedTimestampNilDate() {
        let result = timeFormatterManager.formattedTimestamp(from: nil)
        XCTAssertEqual(result, "Invalid date")
    }
    
    func testFormattedTimestampInvalidDate() {
        let result = timeFormatterManager.formattedTimestamp(from: "Invalid date")
        XCTAssertEqual(result, "Invalid date")
    }
        
    func testFormattedTimestampTodayDate() {
        let dateString = dateFormatter.string(from: today)
        let result = timeFormatterManager.formattedTimestamp(from: dateString)
        XCTAssertEqual(result, "Today")
    }
        
    func testFormattedTimestampThisWeekDate() {
        let thisWeekDate = calendar.date(byAdding: .day, value: -2, to: today)!
        let dateString = dateFormatter.string(from: thisWeekDate)
        let result = timeFormatterManager.formattedTimestamp(from: dateString)
        let expected = calendar.isDate(thisWeekDate, equalTo: today, toGranularity: .weekOfYear) ? "This week" : "This Month"
        XCTAssertEqual(result, expected)
    }
        
    func testFormattedTimestampThisMonthDate() {
        let thisMonthDate = calendar.date(byAdding: .day, value: -15, to: today)!
        let dateString = dateFormatter.string(from: thisMonthDate)
        let result = timeFormatterManager.formattedTimestamp(from: dateString)
        let expected = calendar.isDate(thisMonthDate, equalTo: today, toGranularity: .month) ? "This month" : "This year"
        XCTAssertEqual(result, expected)
    }
        
    func testFormattedTimestampThisYearDate() {
        let thisYearDate = calendar.date(byAdding: .month, value: -3, to: today)!
        let dateString = dateFormatter.string(from: thisYearDate)
        let result = timeFormatterManager.formattedTimestamp(from: dateString)
        let expected = calendar.isDate(thisYearDate, equalTo: today, toGranularity: .year) ? "This year" : "Invalid date"
        XCTAssertEqual(result, expected)
    }
        
    func testFormattedTimestampYearsAgoDate() {
        let yearsAgoDate = calendar.date(byAdding: .year, value: -4, to: today)!
        let dateString = dateFormatter.string(from: yearsAgoDate)
        let result = timeFormatterManager.formattedTimestamp(from: dateString)
        XCTAssertEqual(result, "4 years ago")
    }
}
