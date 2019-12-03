//
//  ListExampleView.swift
//  Exercise 1
//
//  Created by Jake Caccamo on 12/3/19.
//  Copyright © 2019 Jake Caccamo. All rights reserved.
//

import SwiftUI

struct ListExampleView: View {
    
    let myArray = ["Dan", "Jake", "Kirk", "Rob"]
    
    var body: some View {
        /*List {
            ForEach(myArray, id: \.self ) { element in
                Text(element)
            }
        }*/
        
        List(myArray,id: \.self) { element in
            Text(element)
        }
    }
}

struct ListExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ListExampleView()
    }
}
