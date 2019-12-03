//
//  LandmarkDetailView.swift
//  Landmark Book
//
//  Created by Jake Caccamo on 12/3/19.
//  Copyright © 2019 Jake Caccamo. All rights reserved.
//

import SwiftUI

struct LandmarkDetailView: View {
    
    var landmarkName : LandmarkModel
    
    var body: some View {
        VStack {
            ImageCircle(image: landmarkName.image, height: 200, width: 200)
                .overlay(Circle().stroke(Color.white, lineWidth: 6))
                .shadow(radius: 8)
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(landmarkName.name).font(.largeTitle).padding()
                    Text(landmarkName.location).font(.subheadline).padding()
                }
                Spacer()
                Text(landmarkName.type).padding()
            }
        }
    }
}

struct LandmarkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetailView(landmarkName: Pisa)
    }
}
