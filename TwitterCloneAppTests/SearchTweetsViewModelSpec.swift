//
//  SearchTweetsViewModelSpec.swift
//  TwitterCloneAppTests
//
//  Created by Isaac  Casanova on 5/10/20.
//  Copyright © 2020 Isaac  Casanova. All rights reserved.
//

import Nimble
import Quick
@testable import TwitterCloneApp

class SearchTweetsViewModelSpec: QuickSpec {
    var twitterService: MockTwitterService!
}

extension SearchTweetsViewModelSpec {
    override func spec() {
        var subject: SearchTweetsViewModel!
        describe("fetchTweetContents(for searchText: String)") {
            context("when the search for tweets is successful") {
                beforeEach {
                    subject = self.newSubject
                    subject.fetchTweetContents(for: "content")
                }
                it("returns the result to the datasource") {
                    let expected: [TweetRowViewModel] = [.preview]
                    expect(subject.dataSource).toEventually(equal(expected))
                }
            }
            context("when the search for tweets fails") {
                beforeEach {
                    subject = self.newFailSubject
                    subject.dataSource = [.preview]
                    subject.fetchTweetContents(for: "content")
                }
                it("returns an empty array") {
                    expect(subject.dataSource).toEventually(beEmpty())
                }
            }
        }
    }
}

// MARK: - Helpers
private extension SearchTweetsViewModelSpec {
    var newSubject: SearchTweetsViewModel {
        let service = MockTwitterService()
        return SearchTweetsViewModel(twitterService: service)
    }
    
    var newFailSubject: SearchTweetsViewModel {
        let service = MockTwitterService(success: false)
        return SearchTweetsViewModel(twitterService: service)
    }
}
