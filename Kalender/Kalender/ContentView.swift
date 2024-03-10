//
//  ContentView.swift
//  Kalender
//
//  Created by Elias Breitenbach on 09.03.24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var year = Date().getFirstDateOfYear()
    @State private var scrollposition: Int? = nil
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    WeekdayHeaderView()
                        .padding(.bottom)
                    
                    ForEach(year.getAllMonth(), id: \.self) { month in
                        MonthView(month: month)
                            .padding(.bottom, 50)
                            .id(month.get(.month))
                        Divider()
                    }
                }
            }
            .onAppear {
                scrollposition = Int(Date().get(.month))
            }
            .scrollPosition(id: $scrollposition)
            .navigationTitle("Calendar")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    YearSwitcher(year: $year)
                }
            }
        }
    }
}

private struct WeekdayHeaderView: View {
    
    let weekdays = ["Mo", "Di", "Mi", "Do", "Fr", "Sa", "So"]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 25) {
            ForEach(weekdays, id: \.self) { weekday in
                Text(weekday)
            }
        }
    }
}

private struct YearSwitcher: View {
    
    @Binding var year: Date
    
    var body: some View {
        HStack {
            Button("-") {
                year = year.getPreviousYear()
        }
            Text(DateUtils.getYearCaption(year))
            Button("+") {
                year = year.getNextYear()
            }
        }
    }
}

#Preview {
    ContentView()
}
