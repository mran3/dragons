//
//  MockListFlightsVC.swift
//  Dragon Riders UnitTests
//
//  Created by Andres Acevedo on 3/03/22.
//  Copyright © 2022 Andrés A. All rights reserved.
//

import Foundation
@testable import Dragon_Riders


class MockListFlightsVC: ListFlightsView {
    var flightsLoadedCalled = false
    var presentErrorMsgCalled = false
    
    func flightsLoaded(flights: [Flight]) {
        flightsLoadedCalled = true
    }
    
    func presentErrorMsg(messageText: String) {
        presentErrorMsgCalled = true
    }
    
    
}
