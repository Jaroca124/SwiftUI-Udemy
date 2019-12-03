//
//  LandmarkListView.swift
//  Landmark Book
//
//  Created by Jake Caccamo on 12/3/19.
//  Copyright © 2019 Jake Caccamo. All rights reserved.
//

import SwiftUI

struct LandmarkListView: View {
    
    var body: some View {
        NavigationView {
            List(landmarks) { landmark in
                NavigationLink(destination: LandmarkDetailView(landmarkName: landmark)) {
                    ImageCircle(image: landmark.image, height: 50, width: 50)
                    Text(landmark.name).padding()
                }
            }.navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkListView()
    }
}
