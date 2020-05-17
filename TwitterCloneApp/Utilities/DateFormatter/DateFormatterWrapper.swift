//
//  DateFormatterWrapper.swift
//  TwitterCloneApp
//
//  Created by Isaac  Casanova on 5/7/20.
//  Copyright © 2020 Isaac  Casanova. All rights reserved.
//

import Foundation

protocol DateFormatterWrapperType {
    func convertedDateString(for dateString: String, from date: Date) -> String?
}

extension DateFormatterWrapperType {
    func convertedDateString(for dateString: String) -> String? {
        return convertedDateString(for: dateString, from: Date())
    }
}

class DateFormatterWrapper : DateFormatterWrapperType {
    static let shared = DateFormatterWrapper()
    
    private lazy var formatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        return dateFormatter
    }()
}

extension DateFormatterWrapper {
    func convertedDateString(for dateString: String, from date: Date = Date()) -> String? {
        formatter.dateFormat = "E, MMM d HH:mm:ss Z yyyy"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        
        guard let tweetDate = formatter.date(from: dateString) else {
            return nil
        }
        
        return Date.relativeTimeFromDate(referenceDate: date, tweetDate: tweetDate)
    }
}
