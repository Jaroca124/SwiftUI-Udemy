//
//  LandmarkModel.swift
//  Landmark Book
//
//  Created by Jake Caccamo on 12/3/19.
//  Copyright © 2019 Jake Caccamo. All rights reserved.
//

import SwiftUI
import CoreLocation

struct LandmarkModel: Identifiable {
    var id = UUID()
    var name : String
    var type : String
    var location : String
    var image : Image
    var coordinates : Coordinates
    
    var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
}

struct Coordinates {
    var latitude : Double
    var longitude : Double
}

var Eiffel = LandmarkModel(name: "Eiffel", type: "Tower", location: "Paris, France", image: Image("Eiffel"), coordinates: Coordinates(latitude: 10.0, longitude: 10.0))
var LondonBridge = LandmarkModel(name: "London Bridge", type: "Bridge", location: "London, UK", image: Image("LondonBridge"), coordinates: Coordinates(latitude: 10.0, longitude: 10.0))
var Colosseum = LandmarkModel(name: "Colosseum", type: "Colosseum", location: "Rome, Italy", image: Image("Colloseum"), coordinates: Coordinates(latitude: 10.0, longitude: 10.0))
var Pisa = LandmarkModel(name: "Pisa", type: "Tower", location: "Piazza del Duomo, Italy", image: Image("Pisa"), coordinates: Coordinates(latitude: 43.72, longitude: 10.39))

var landmarks = [Eiffel, LondonBridge, Colosseum, Pisa]
