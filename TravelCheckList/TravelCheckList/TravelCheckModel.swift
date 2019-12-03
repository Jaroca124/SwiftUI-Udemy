//
//  TracelCheckModel.swift
//  TravelCheckList
//
//  Created by Jake Caccamo on 12/3/19.
//  Copyright © 2019 Jake Caccamo. All rights reserved.
//

import SwiftUI

struct TravelCheckModel: Identifiable {
    var id = UUID()
    var name : String
    var description : String
}

var travelCheck1 = TravelCheckModel(name: "Istanbul", description: "Nice city")
var travelCheck2 = TravelCheckModel(name: "Paris", description: "Love city")
var travelCheck3 = TravelCheckModel(name: "Vancouver", description: "Hate city")

var travelArray = [travelCheck1, travelCheck2, travelCheck3]
