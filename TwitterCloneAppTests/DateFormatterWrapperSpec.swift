//
//  DateFormatterWrapperSpec.swift
//  TwitterCloneAppTests
//
//  Created by Isaac  Casanova on 5/10/20.
//  Copyright © 2020 Isaac  Casanova. All rights reserved.
//

import Nimble
import Quick
@testable import TwitterCloneApp

class DateFormatterWrapperSpec: QuickSpec { }

extension DateFormatterWrapperSpec {
    override func spec() {
        var subject: DateFormatterWrapper!
        describe("convertedDateString(for dateString: String)") {
            beforeEach { subject = DateFormatterWrapper() }
            context("when the dateFormat is `E, MMM d HH:mm:ss Z yyyy`") {
                it("returns a date converted into yyyy-MM-dddd and is 3 days ago") {
                    let referenceDate = DateComponents(
                        calendar: .current,
                        year: 2020,
                        month: 5,
                        day: 16,
                        hour: 9,
                        minute: 30
                    ).date!
                    expect(subject.convertedDateString(for: "Wed May 13 12:25:57 +0000 2020", from: referenceDate)).to(equal("3d"))
                }
            }
            context("when the dateFormat is doesn't match") {
                it("returns nil") {
                    expect(subject.convertedDateString(for: "2020-05-13T01:32:46+0000")).to(beNil())
                }
            }
        }
    }
}
