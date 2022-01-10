//
//  ListLocationsPresenter.swift
//  Dragon Ride
//
//  Copyright © 2021 Andrés A. All rights reserved.
//

import Foundation

// I use protocols so Unit testing can be done easily using Mock objects.
protocol ListFlightsView: AnyObject {
    func flightsLoaded(flights: [Flight])
}

class ListFlightsPresenter {
    weak private var listFlightsView: ListFlightsView?
    private let jsonParser = JSONParser()
    private var flightsService = FlightsService()
    func attachView(_ viewController: ListFlightsView){
        self.listFlightsView = viewController
    }
    
    func detachView(_ viewController: ListFlightsView){
        self.listFlightsView = nil
    }
    func getFlights() {
        flightsService.getFlights(type: FlightResponse.self) { [weak self] result in
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


