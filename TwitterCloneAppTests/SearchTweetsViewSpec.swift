//
//  SearchTweetsViewSpec.swift
//  TwitterCloneAppTests
//
//  Created by Isaac  Casanova on 5/6/20.
//  Copyright © 2020 Isaac  Casanova. All rights reserved.
//

import Nimble
import Quick
import ViewInspector
@testable import TwitterCloneApp

extension SearchTweetsView: Inspectable { }

class SearchTweetsViewSpec: QuickSpec {
    var subject: SearchTweetsView!
}

extension SearchTweetsViewSpec {
    override func spec() {
        beforeEach { self.subject = self.newSubject }
        describe("searchField") {
            it("displays the proper default text") {
                let searchFieldText = try! self.subject
                    .inspect()
                    .view(SearchTweetsView.self)
                    .navigationView()
                    .list(0)
                    .hStack(0)
                    .textField(0)
                    .text()
                    .string()
                expect(searchFieldText).to(equal("Search Tweets"))
            }
        }
    }
}

// MARK: - Helpers
private extension SearchTweetsViewSpec {
    var newSubject: SearchTweetsView {
        let mockService = MockTwitterService()
        let viewModel = SearchTweetsViewModel(twitterService: mockService)
        return SearchTweetsView(viewModel: viewModel)
    }
}
