//
//  CalenderExtention.swift
//  Kalender
//
//  Created by Elias Breitenbach on 10.03.24.
//

import Foundation


extension Calendar {
    func startOfYear(date: Date) -> Date {
        return self.date(from: self.dateComponents([.year, .year], from: date))!
    }
}
