//
//  ChatModel.swift
//  WhatsAppClone
//
//  Created by Jake Caccamo on 12/6/19.
//  Copyright © 2019 Jake Caccamo. All rights reserved.
//

import SwiftUI

struct ChatModel : Identifiable {
    var id : Int
    var message : String
    var uidFromFirebase : String
    var messageTo : String
    var messageFrom : String
    var messageDate : Date
    var messageFromMe : Bool
}
