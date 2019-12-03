//
//  ContentView.swift
//  TravelCheckList
//
//  Created by Jake Caccamo on 12/3/19.
//  Copyright © 2019 Jake Caccamo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var characterName = "Jake"
    
    var body: some View {
        VStack {
            Text(characterName).padding().font(.largeTitle)
            Button(action: {
                self.characterName = "Laura"
            }) {
                Text("Change Name")
            }
            TextField("placeholder", text: $characterName)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
