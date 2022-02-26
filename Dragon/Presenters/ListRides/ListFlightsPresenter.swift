//
//  ListLocationsPresenter.swift
//  Dragon Ride
//
//  Copyright © 2021 Andrés A. All rights reserved.
//

import Foundation

// I use protocols so Unit testing can be done easily using Mock objects.
protocol ListFlightsPresenterProtocol: AnyObject {
    var listFlightsView: ListFlightsView? { get }
    func attachView(_ viewController: ListFlightsView)
    func detachView(_ viewController: ListFlightsView)
    func getFlights()
}

class ListFlightsPresenter: ListFlightsPresenterProtocol {
    weak var listFlightsView: ListFlightsView?
    private var flightsService: FlightsServiceProtocol = FlightsService()
    
    func attachView(_ viewController: ListFlightsView){
        self.listFlightsView = viewController
    }
    
    func detachView(_ viewController: ListFlightsView){
        self.listFlightsView = nil
    }
    func getFlights() {
        flightsService.getFlights { [weak self] result in
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


