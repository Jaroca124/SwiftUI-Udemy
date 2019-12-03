//
//  TravelCheckList.swift
//  TravelCheckList
//
//  Created by Jake Caccamo on 12/3/19.
//  Copyright © 2019 Jake Caccamo. All rights reserved.
//

import SwiftUI

struct TravelListView: View {
    var body: some View {
        NavigationView {
            List(travelArray) { travel in
                NavigationLink(destination: TravelDetailsView(chosenTravel: travel)) {
                    Text(travel.name)
                }
            }
        }
    }
}

struct TravelListView_Previews: PreviewProvider {
    static var previews: some View {
        TravelListView()
    }
}
