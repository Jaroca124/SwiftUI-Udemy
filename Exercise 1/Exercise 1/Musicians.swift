//
//  Musicians.swift
//  Exercise 1
//
//  Created by Jake Caccamo on 12/3/19.
//  Copyright © 2019 Jake Caccamo. All rights reserved.
//

import Foundation
import SwiftUI

struct Musician : Identifiable {
    var id = UUID()
    var genre : String
    var bands : [String]
}

let rock = Musician(genre: "Rock", bands: ["Led Zepp", "Pink Floyd"])
let metal = Musician(genre: "Metal", bands: ["Metallica", "Megadeth"])
let pop = Musician(genre: "Pop", bands: ["Bey", "Lady Gaga"])

let musicianArray = [rock, metal, pop]
