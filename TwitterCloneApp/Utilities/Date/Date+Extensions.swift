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
    func relativeTimeFromDate() -> String {
        let secondsPassed = Int(Date().timeIntervalSince(self))
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
