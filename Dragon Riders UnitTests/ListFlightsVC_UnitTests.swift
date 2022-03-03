//
//  ListFlightsVCUnitTest.swift
//  Dragon Riders UnitTests
//
//  Created by Andres Acevedo on 26/01/22.
//  Copyright © 2022 Andrés A. All rights reserved.
//

import XCTest
@testable import Dragon_Riders

class ListFlightsVCUnitTest: XCTestCase {
    var subject: ListFlightsViewController!
    var mockPresenter: MockFlightsPresenter!
    override func setUpWithError() throws {
        super.setUp()
        subject = ListFlightsViewController()
        mockPresenter = MockFlightsPresenter()
        subject.presenter = mockPresenter
        subject.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // Using === we check that the presenter view controller is the mock we injected.
    func testPresenterBinded() throws {
        let presenterView = subject.presenter.listFlightsView
        XCTAssert(presenterView === subject)
    }
    
    // With this we test flightsLoaded function is called and 
    func testCorrectNumberOfFlights() throws {
        XCTAssertEqual(subject.flights.count, 2) // There are two example flights in the JSON used for tests.
    }
    
    // This test can helps us find unnecesary API requests.
    func testGetFlightsCalledOnceOnLoad() throws {
        XCTAssertEqual(mockPresenter.getFlightsTimesCalled, 1)
    }

}
