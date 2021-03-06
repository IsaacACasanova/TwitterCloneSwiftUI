//
//  Date+Extensions.swift
//  TwitterCloneApp
//
//  Created by Isaac  Casanova on 5/16/20.
//  Copyright © 2020 Isaac  Casanova. All rights reserved.
//

// Credit: https://www.youtube.com/watch?v=IjJxaUXKVXU

import Foundation

extension Date {
    static func relativeTimeFromDate(referenceDate : Date, tweetDate: Date) -> String {
        let secondsPassed = Int(referenceDate.timeIntervalSince(tweetDate))
        let secondsPerMinute = 60
        let secondsPerHour = secondsPerMinute * 60
        let secondsPerDay = secondsPerHour * 24
        let secondsPerWeek = secondsPerDay * 7
        
        if secondsPassed < secondsPerMinute {
            return "\(secondsPassed)s"
        } else if secondsPassed < secondsPerHour {
            return "\(secondsPassed / secondsPerMinute)m"
        } else if secondsPassed < secondsPerDay {
            return "\(secondsPassed / secondsPerHour)h"
        } else if secondsPassed < secondsPerWeek {
            return "\(secondsPassed / secondsPerDay)d"
        }
        
        return "\(secondsPassed / secondsPerWeek)w"
    }
}

extension Date {
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
}
