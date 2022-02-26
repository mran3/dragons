//
//  Dragon_Riders_UnitTests.swift
//  Dragon Riders UnitTests
//
//  Created by Andres Acevedo on 25/01/22.
//  Copyright © 2022 Andrés A. All rights reserved.
//

import XCTest
@testable import Dragon_Riders

class JSONParser_Tests: XCTestCase {
    
    var subject: JSONParser!
    var session: MockURLSession!

    override func setUpWithError() throws {
        super.setUp()
        session = MockURLSession()
        subject = JSONParser(session: session)
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // Very basic test to check the session uses the URL we are sending.
    func testUsesSentUrl() throws {
        let url = URL(string: "http://turtle-techies.com")!

        subject.fetchJSON(of: Flight.self, from: url) {
            result in
            print(result)
        }
        XCTAssertEqual(session.lastURL, url)
    }
    
    // Very basic test to check the session dataTask gets called.
    func testResumeGetsCalled() throws {
        let url = URL(string: "http://turtle-techies.com")!

        subject.fetchJSON(of: Flight.self, from: url) {
            result in
            print(result)
        }
        XCTAssertEqual(session.nextDataTask.resumeWasCalled, true)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
