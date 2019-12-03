//
//  LandmarkModel.swift
//  Landmark Book
//
//  Created by Jake Caccamo on 12/3/19.
//  Copyright © 2019 Jake Caccamo. All rights reserved.
//

import SwiftUI

struct LandmarkModel: Identifiable {
    var id = UUID()
    var name : String
    var type : String
    var location : String
    var image : Image
}

var Eiffel = LandmarkModel(name: "Eiffel", type: "Tower", location: "Paris, France", image: Image("Eiffel"))
var LondonBridge = LandmarkModel(name: "London Bridge", type: "Bridge", location: "London, UK", image: Image("LondonBridge"))
var Colloseum = LandmarkModel(name: "Colloseum", type: "Colloseum", location: "Rome, Italy", image: Image("Colloseum"))
var Pisa = LandmarkModel(name: "Pisa", type: "Tower", location: "Piazza del Duomo, Italy", image: Image("Pisa"))

var landmarks = [Eiffel, LondonBridge, Colloseum, Pisa]
