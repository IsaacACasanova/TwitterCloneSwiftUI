//
//  DateFormatterWrapper.swift
//  TwitterCloneApp
//
//  Created by Isaac  Casanova on 5/7/20.
//  Copyright © 2020 Isaac  Casanova. All rights reserved.
//

import Foundation

class DateFormatterWrapper {
    static let shared = DateFormatterWrapper()
    private lazy var formatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        return dateFormatter
    }()
    
    func convertedDateString(for dateString: String) -> String? {
        formatter.dateFormat = "E, MMM d HH:mm:ss Z yyyy"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        
        guard let initialDate = formatter.date(from: dateString) else {
            return nil
        }
        
        formatter.dateFormat = "MMM d yyyy"

        return formatter.string(from: initialDate)
    }
}
