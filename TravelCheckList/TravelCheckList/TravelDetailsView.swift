//
//  TravelDetailsView.swift
//  TravelCheckList
//
//  Created by Jake Caccamo on 12/3/19.
//  Copyright © 2019 Jake Caccamo. All rights reserved.
//

import SwiftUI

struct TravelDetailsView: View {
    
    var chosenTravel : TravelCheckModel
    @State var seen = false
    
    var body: some View {
        VStack {
            Text(chosenTravel.name).font(.largeTitle).padding().foregroundColor(self.seen ? .blue : .black)
            Text(chosenTravel.description).padding()
            SeenButton(seenOrNot: $seen)
        }
    }
}

struct TravelDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TravelDetailsView(chosenTravel: travelCheck1)
    }
}
