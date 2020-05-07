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
        describe("init") {
            it("displays a searchField with the proper default text") {
                let searchFieldText = try? self.subject
                    .inspect()
                    .view(SearchTweetsView.self)
                    .navigationView()
                    .list(0)[0]
                    .hStack()
                    .textField(0)
                    .text()
                    .string()
                expect(searchFieldText).to(equal("Search Tweets"))
            }
            
            it("displays an emptySection with the proper text") {
                let emptySectionText = try? self.subject
                    .inspect()
                    .view(SearchTweetsView.self)
                    .navigationView()
                    .list(0)[1]
                    .section()
                    .text(0)
                    .string()

                expect(emptySectionText).to(equal("No results"))
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
