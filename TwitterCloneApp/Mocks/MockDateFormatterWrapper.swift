//
//  MockDateFormatterWrapper.swift
//  TwitterCloneApp
//
//  Created by Isaac  Casanova on 5/13/20.
//  Copyright © 2020 Isaac  Casanova. All rights reserved.
//

import Foundation

class MockDateFormatterWrapper: DateFormatterWrapperType {
    
    let dateString: String
    
    init(dateString: String = "01/01/2000") {
        self.dateString = dateString
    }
    
    func convertedDateString(for dateString: String, from date: Date) -> String? {
        dateString
    }
}
