//
//  Month.swift
//  Interview
//
//  Created by Chris Anderson on 5/17/21.
//

import Foundation

struct Month {
    let date: Date
    let days: [Day]

    /// Create a new Month by passing any date inside of that month
    /// and a list of all days the user completed a prayer in that month.
    ///
    /// - Parameter date: Any Date inside of the month
    /// - Parameter days: A list of the days in that month.
    ///
    init(date: Date, days: [Day]) {
        self.date = date
        self.days = days
    }

    var monthString: String {
        date.formatted(.dateTime.month(.wide))
    }

    var yearString: String {
        date.formatted(.dateTime.year(.padded(4)))
    }

    var month: Int {
        return Calendar.current.component(.month, from: date)
    }
    var year: Int {
        return Calendar.current.component(.year, from: date)
    }
    var daysInMonth: Int {
        return date.daysInMonth
    }
    var firstWeekDay: Int {
        return date.firstDayOfTheMonth.weekday
    }
    var lastWeekDay: Int {
        return date.lastDayOfMonth.weekday
    }
}
