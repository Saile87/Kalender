//
//  DateUtils.swift
//  Kalender
//
//  Created by Elias Breitenbach on 10.03.24.
//

import Foundation


class DateUtils {
    
    private static var monthFormatter = createMonthFormatter()
    private static var yearFormatter = createYearFormatter()
    
    static func getMonthCaption(_ date: Date) -> String {
        return monthFormatter.string(from: date)
    }
    
    static func getYearCaption(_ date: Date) -> String {
        return yearFormatter.string(from: date)
    }
    
    private static func createMonthFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter
    }
    private static func createYearFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY"
        return formatter
    }
    
}
