//
//  MonthView.swift
//  Kalender
//
//  Created by Elias Breitenbach on 10.03.24.
//

import Foundation
import SwiftUI

let columns = Array(repeating: GridItem(.flexible()), count: 7)

struct MonthView: View {
    
    var month: Date
    
    var body: some View {
        Text(DateUtils.getMonthCaption(month))
            .font(.title2)
            .padding(.leading, 9)
            .frame(maxWidth: .infinity, alignment: .leading)
        LazyVGrid(columns: columns, spacing: 15) {
            
            ForEach(0..<month.getWeekday(), id: \.self) { _ in
                Spacer()
            }
            
            ForEach(month.getAllDaysToNextMonth(), id: \.self) { day in
                NavigationLink(destination: Text("")) {
                    DayView(date: day)
                }
            }
        }
    }
}

#Preview {
    MonthView(month: Date())
}
