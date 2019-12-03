//
//  SeenButton.swift
//  TravelCheckList
//
//  Created by Jake Caccamo on 12/3/19.
//  Copyright © 2019 Jake Caccamo. All rights reserved.
//

import SwiftUI

struct SeenButton: View {
    
    @Binding var seenOrNot: Bool
    
    var body: some View {
        
        Button(action: {
            self.seenOrNot.toggle()
        }) {
            Text("Seen / Not Seen")
        }
    }
}

struct SeenButton_Previews: PreviewProvider {
    static var previews: some View {
        Text("test")
    }
}
