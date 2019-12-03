//
//  NavigationFirstView.swift
//  Exercise 1
//
//  Created by Jake Caccamo on 12/3/19.
//  Copyright © 2019 Jake Caccamo. All rights reserved.
//

import SwiftUI

struct NavigationFirstView: View {
    var body: some View {
        NavigationView {
            VStack {
                ImageCircle(url: Image("BG"))
                
                Button(action: {
                    
                }) {
                    Text("Go").padding(.horizontal, 40).padding(.vertical, 20)
                }
                
                NavigationLink(destination: NavigationSecondView()) {
                    Text("Navigation Link")
                }.padding()
            }.navigationBarTitle(Text("First View"))
        }
    }
}

struct NavigationFirstView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationFirstView()
    }
}
