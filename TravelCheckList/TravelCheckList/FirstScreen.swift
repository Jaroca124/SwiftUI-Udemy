//
//  FirstScreen.swift
//  TravelCheckList
//
//  Created by Jake Caccamo on 12/3/19.
//  Copyright © 2019 Jake Caccamo. All rights reserved.
//

import SwiftUI

struct FirstScreen: View {
    
    @State var shown = false
    @State var number = 3
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.number -= 1
                }) {
                    Text("-")
                }
                Text(String(number)).padding().font(.largeTitle)
                Button(action: {
                    self.number += 1
                }) {
                    Text("+")
                }
            }
            Button(action: {
                if (self.number > 5) {
                    self.shown.toggle()
                }
            }) {
                Text("Go to 2nd")
            }.sheet(isPresented: $shown) { () -> SecondScreen in
                return SecondScreen()
            }
        }
    }
}

struct FirstScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreen()
    }
}
