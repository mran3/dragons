//
//  MockListFlightsPresenter.swift
//  Dragon Riders UnitTests
//
//  Created by Andres Acevedo on 26/01/22.
//  Copyright © 2022 Andrés A. All rights reserved.
//

import Foundation
@testable import Dragon_Riders

class MockFlightsPresenter: ListFlightsPresenter {
    var getFlightsTimesCalled = 0
    
    override func getFlights() {
        print("get flights")
        getFlightsTimesCalled += 1
        let flightsService = MockFlightsService()
        flightsService.getFlights {
            [weak self] result in
            guard let self = self else {
                print("No self reference found")
                return
            }
            switch result {
            case .failure(let error):
                if error is DataError {
                    print("DataError = \(error)")
                } else {
                    print(error.localizedDescription)
                }
                self.listFlightsView?.presentErrorMsg(messageText: NSLocalizedString("api.error", comment: ""))
            case .success(let response):
                var flights:[Flight] = response.flights
                flights.sort {
                    $0.outbound.destination < $1.outbound.destination
                }
                self.listFlightsView?.flightsLoaded(flights: flights)
            }

        }
    }
}
