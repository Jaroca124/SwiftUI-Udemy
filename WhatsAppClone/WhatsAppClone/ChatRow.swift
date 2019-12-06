//
//  ChatRow.swift
//  WhatsAppClone
//
//  Created by Jake Caccamo on 12/6/19.
//  Copyright © 2019 Jake Caccamo. All rights reserved.
//

import SwiftUI
import Firebase

struct ChatRow: View {
    var chatMessage : ChatModel
    var userToChat : UserModel
    
    var body: some View {
        Group {
            if (chatMessage.messageFrom == Auth.auth().currentUser!.uid && chatMessage.messageTo == userToChat.uidFirebase) {
                HStack {
                    Text(chatMessage.message).bold().foregroundColor(Color.blue).padding()
                    Spacer()
                }
            } else if (chatMessage.messageFrom == userToChat.uidFirebase && chatMessage.messageTo == Auth.auth().currentUser!.uid) {
                HStack {
                    Spacer()
                    Text(chatMessage.message).bold().foregroundColor(Color.black).padding()
                }
            }
        }.frame(width: UIScreen.main.bounds.width * 0.95)
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow(chatMessage: ChatModel(id: 0, message: "Test Message", uidFromFirebase: "DSFSDF", messageTo: "RECIPIENT", messageFrom: "SENDER", messageDate: Date(), messageFromMe: true), userToChat: UserModel(id: 0, name: "RECIPIENT", uidFirebase: "ABC"))
    }
}
