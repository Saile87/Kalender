//
//  DayView.swift
//  Kalender
//
//  Created by Elias Breitenbach on 10.03.24.
//

import Foundation
import SwiftUI

struct DayView: View {
    
    var date: Date
    
    var body: some View {
        Text("\(date.get(.day))")
            .foregroundColor(date.isWeekend() ? weekendColor : .primary)
            .background {
                if date.isToday() {
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.red)
                }

            }
    }
}

#Preview {
    DayView(date: Date())
}

#Preview {
    DayView(date: Date(timeIntervalSince1970: TimeInterval(1711900977)))
}
