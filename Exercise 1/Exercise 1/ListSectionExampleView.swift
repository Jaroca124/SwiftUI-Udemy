//
//  ListSectionExampleView.swift
//  Exercise 1
//
//  Created by Jake Caccamo on 12/3/19.
//  Copyright © 2019 Jake Caccamo. All rights reserved.
//

import SwiftUI

struct ListSectionExampleView: View {
    var body: some View {
        List {
            ForEach(musicianArray) { musician in
                Section(header: Text(musician.genre)) {
                    ForEach(musician.bands, id: \.self) { band in
                        Text(band)
                    }
                }
            }
        }
    }
}

struct ListSectionExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ListSectionExampleView()
    }
}
