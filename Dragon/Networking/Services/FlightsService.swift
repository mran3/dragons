//
//  FlightsService.swift
//  Dragon Ride
//
//  Created by Andres A. on 24/11/21.
//  Copyright © 2021 Andrés A. All rights reserved.
//

import Foundation

class FlightsService {
    private let apiConfig2 = APIConfig2()
    private let jsonParser = JSONParser()
    func getFlights<T: Decodable>(type: T.Type, completion: @escaping FetchResult<T>) {
        let jsonURL = apiConfig2.makeURL(with: .current)
        
        jsonParser.fetchJSON(of: T.self, from: jsonURL!) { result in
            completion(result)
        }
    }
}
