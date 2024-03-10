//
//  DateExtention.swift
//  Kalender
//
//  Created by Elias Breitenbach on 10.03.24.
//

import Foundation


extension Date {
    func get(_ component: Calendar.Component) -> Int {
        return Calendar.current.component(component, from: self)
    }
    
    func isWeekend() -> Bool {
        return Calendar.current.isDateInWeekend(self)
    }
    
    func isToday() -> Bool {
        return Calendar.current.isDate(Date(), inSameDayAs: self)
    }
    
    func getWeekday() -> Int {
        let weekday = get(.weekday) - 2
        if weekday < 0 {
            return 7 + weekday
        }
        return weekday
    }
    
    func getAllDaysToNextMonth() -> [Date] {
        var days = [Date]()
        for i in 0..<getDaysCountOfMounth() {
           let day = Calendar.current.date(byAdding: .day, value: i, to: self)!
            days.append(day)
        }
        return days
    }
    
    private func getDaysCountOfMounth() -> Int {
        return Calendar.current.range(of: .day, in: .month, for: self)!.count
    }
    
    func getFirstDateOfYear() -> Date {
        return Calendar.current.startOfYear(date: self)
    }
    
    func getAllMonth() -> [Date] {
        var months = [Date]()
        for i in 0..<12 {
            let month = Calendar.current.date(byAdding: .month, value: i, to: self)!
            months.append(month)
        }
        return months
    }
    
    func getNextYear() -> Date {
        return Calendar.current.date(byAdding: .year, value: 1, to: self)!
    }
    
    func getPreviousYear() -> Date {
        return Calendar.current.date(byAdding: .year, value: -1, to: self)!
    }
}
