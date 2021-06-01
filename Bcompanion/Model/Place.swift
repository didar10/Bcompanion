//
//  Place.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/31/21.
//

import Foundation

struct Place: Decodable {
    let placeName: String
    let placePhoto: String
    let cityName: String
}

struct PlaceDescription: Decodable {
    let placeName: String
    let placePhotos: String
    let placeDescription: String
}

struct PlaceRoute: Decodable {
    let placeName: String
    let placePhotos: String
    let cityName: String
    let latitude: Double
    let longitude: Double
    let routeByCarText: String
    let routeByWalkingText: String
    let routeMap: String
}
