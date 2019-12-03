//
//  ImageCircle.swift
//  Exercise 1
//
//  Created by Jake Caccamo on 12/3/19.
//  Copyright © 2019 Jake Caccamo. All rights reserved.
//

import SwiftUI

struct ImageCircle: View {
    
    var url : Image
    
    var body: some View {
        url
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: UIScreen.main.bounds.width * 0.9,
               height: 200)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.red, lineWidth: 6))
        .shadow(radius: 10)
    }
}

struct ImageCircle_Previews: PreviewProvider {
    static var previews: some View {
        ImageCircle(url: Image("BG"))
    }
}
