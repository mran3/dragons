//
//  FlightModel.swift
//  Dragon Ride
//
//  Created by Andres Acevedo on 26/11/21.
//  Copyright © 2021 Andrés A. All rights reserved.
//

import Foundation

struct FlightResponse: Decodable {
    let flights : [Flight]
    enum CodingKeys : String, CodingKey { case flights = "results" }
}
struct Flight: Codable {
    let price: Price
    let outbound : Segment
    let inbound : Segment
    let currency: String
    enum CodingKeys: String, CodingKey {
        case outbound
        case inbound
        case currency
        case price
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        outbound = try container.decode(Segment.self, forKey: .outbound)
        inbound = try container.decode(Segment.self, forKey: .inbound)
        currency = try container.decode(String.self, forKey: .currency)
        let priceData  = try container.decode(Double.self, forKey: .price)
        price = Price(price: priceData, currency: currency)
    }
}
struct Price: Codable {
    let price: Double
    let currency: String
}
struct flightsToaDestination{
    let destination:String
    let flights:[Flight]
}
struct RouteSection {
    var route: String
    var flights: [Flight]
}
struct Segment: Codable{
    let airline: String
    let airlineImage: String
    let origin: String
    let destination: String

    let departureDate: String
    let departureTime: String

    let arrivalDate: String
    let arrivalTime: String
    let arrival: Date
    let departure: Date
    enum CodingKeys: String, CodingKey {
        case airline
        case airlineImage
        case origin
        case destination
        case departureDate
        case departureTime
        case arrivalDate
        case arrivalTime
        case arrival
        case departure
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        airline = try container.decode(String.self, forKey: .airline)
        airlineImage = try container.decode(String.self, forKey: .airlineImage)
        origin = try container.decode(String.self, forKey: .origin)
        destination = try container.decode(String.self, forKey: .destination)
        departureDate = try container.decode(String.self, forKey: .departureDate)
        departureTime = try container.decode(String.self, forKey: .departureTime)
        arrivalDate = try container.decode(String.self, forKey: .arrivalDate)
        arrivalTime = try container.decode(String.self, forKey: .arrivalTime)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "m/d/y k:m"
        arrival = dateFormatter.date(from:arrivalDate+" "+arrivalTime)!
        departure = dateFormatter.date(from:departureDate+" "+departureTime)!
       
    }
}
