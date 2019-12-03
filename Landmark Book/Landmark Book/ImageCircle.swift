//
//  ImageCircle.swift
//  Landmark Book
//
//  Created by Jake Caccamo on 12/3/19.
//  Copyright © 2019 Jake Caccamo. All rights reserved.
//

import SwiftUI

struct ImageCircle: View {
    
    var image : Image
    var height : CGFloat
    var width : CGFloat
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: height, alignment: .leading)
            .clipShape(Circle())
    }
}

struct ImageCircle_Previews: PreviewProvider {
    static var previews: some View {
        ImageCircle(image: Image("Pisa"), height: 50, width: 50)
    }
}
