//
//  MockFlightService.swift
//  Dragon Riders UnitTests
//
//  Created by Andres Acevedo on 27/01/22.
//  Copyright © 2022 Andrés A. All rights reserved.
//

import Foundation
@testable import Dragon_Riders

enum ServiceError: Error {
    case getError(String)
}

class MockFlightsService: FlightsServiceProtocol {
//    private let apiConfig2 = APIConfig2()
    private let jsonParser = JSONParser(session: MockURLSession())
    var makeRequestFail = false
    
    func getFlights(completion: @escaping FetchResultCallback<FlightResponse>) {
        if makeRequestFail {
            completion(.failure(ServiceError.getError("Could not get flights")))
        } else {
            let jsonData = readLocalFile(forName: "flights")
            jsonParser.decodeJson(data: jsonData, completion: completion)
        }
    }
    
    
    private func readLocalFile(forName name: String) ->  Data  {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        fatalError("Could not read local json")
    }
}
    
