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
extension TweetRow: Inspectable { }

class SearchTweetsViewSpec: QuickSpec {
    var viewModel: SearchTweetsViewModel!
}

extension SearchTweetsViewSpec {
    override func spec() {
        var subject: SearchTweetsView!
        beforeEach { subject = self.newSubject }
        describe("on creation") {
            it("displays a searchField with the proper default text") {
                let searchFieldText = try? subject
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
                let emptySectionText = try? subject
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
        
        describe("entering a value") {
            context("when a value is entered into the searchField") {
                beforeEach {
                    subject = self.newSubjectWithDataSource
                    try? subject
                    .inspect()
                    .view(SearchTweetsView.self)
                    .navigationView()
                    .list(0)[0]
                    .hStack()
                    .textField(0)
                    .callOnEditingChanged()
                }
                
                it("renders TweetRows") {
                    let rows = try? subject
                    .inspect()
                    .view(SearchTweetsView.self)
                    .navigationView()
                    .list(0)[1]
                    .section()
                    .forEach(0)
                    .map { try $0.view(TweetRow.self) }
                    expect(rows).toNot(beNil())
                }
                
                it("does not render the emptySection") {
                    let emptySectionText = try? subject
                    .inspect()
                    .view(SearchTweetsView.self)
                    .navigationView()
                    .list(0)[1]
                    .section()
                    .text(0)
                    .string()
                    expect(emptySectionText).to(beNil())
                }
            }
        }
    }
}

// MARK: - Helpers
private extension SearchTweetsViewSpec {
    var newSubject: SearchTweetsView {
         let viewModel = MockSearchTweetsViewModel()
        return SearchTweetsView(viewModel: viewModel)
    }
    
    var newSubjectWithDataSource: SearchTweetsView {
        let viewModel = MockSearchTweetsViewModel()
        viewModel.dataSource = [.preview]
        return SearchTweetsView(viewModel: viewModel)
    }
}
