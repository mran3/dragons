//
//  FlightsService.swift
//  Dragon Ride
//
//  Created by Andres A. on 24/11/21.
//  Copyright © 2021 Andrés A. All rights reserved.
//

import Foundation

protocol FlightsServiceProtocol {
    func getFlights(completion: @escaping FetchResultCallback<FlightResponse>)
}

class FlightsService: FlightsServiceProtocol {
    private let apiConfig2 = APIConfig2()
    private let jsonParser = JSONParser()
    func getFlights(completion: @escaping FetchResultCallback<FlightResponse>) {
        let jsonURL = apiConfig2.makeURL(with: .current)
        
        jsonParser.fetchJSON(of: FlightResponse.self, from: jsonURL!) { result in
            completion(result)
        }
    }
}
