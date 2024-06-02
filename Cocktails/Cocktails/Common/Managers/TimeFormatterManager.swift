//
//  TimeFormatterManager.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 30.05.2024..
//

import Foundation

protocol TimeFormatterManagerInterface {
    func formattedTimestamp(from dateString: String?) -> String
}

class TimeFormatterManager: TimeFormatterManagerInterface {
    
    static let shared = TimeFormatterManager()
    
    private let dateFormatter: DateFormatter
    
    private init() {
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }
    
    func formattedTimestamp(from dateString: String?) -> String {
        guard let dateString, let date = dateFormatter.date(from: dateString) else { return "Invalid date" }
        
        let calendar = Calendar.current
        let now = Date()

        if calendar.isDateInToday(date) {
            return "Today"
        } else if calendar.isDate(date, equalTo: now, toGranularity: .weekOfYear) {
            return "This week"
        } else if calendar.isDate(date, equalTo: now, toGranularity: .month) {
            return "This month"
        } else if calendar.isDate(date, equalTo: now, toGranularity: .year) {
            return "This year"
        } else {
            let yearsAgo = calendar.dateComponents([.year], from: date, to: now).year ?? 0
            return "\(yearsAgo) years ago"
        }
    }
}
