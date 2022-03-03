//
//  ListFlightsPresenter_UnitTests.swift
//  Dragon Riders UnitTests
//
//  Created by Andres Acevedo on 28/02/22.
//  Copyright © 2022 Andrés A. All rights reserved.
//

import XCTest
@testable import Dragon_Riders

class ListFlightsPresenter_UnitTests: XCTestCase {
    
    var subject: ListFlightsPresenter!
    var mockFlightsService: MockFlightsService!
    var mockListFlightVC: MockListFlightsVC!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        subject = ListFlightsPresenter()
        mockFlightsService = MockFlightsService()
        subject.flightsService = mockFlightsService
        mockListFlightVC = MockListFlightsVC()
        subject.attachView(mockListFlightVC)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFailingServiceTest() throws {
        mockFlightsService.makeRequestFail = true
        subject.getFlights()
        XCTAssertTrue(mockListFlightVC.presentErrorMsgCalled)
    }

}
