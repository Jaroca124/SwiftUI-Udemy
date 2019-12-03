//
//  ContentView.swift
//  Exercise 1
//
//  Created by Jake Caccamo on 12/3/19.
//  Copyright © 2019 Jake Caccamo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
            Text("Hello, World!").font(Font.largeTitle)
            ImageCircle(url: Image("BG"))
            ImageCircle(url: Image("Drone"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
