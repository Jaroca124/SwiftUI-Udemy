//
//  ChatView.swift
//  WhatsAppClone
//
//  Created by Jake Caccamo on 12/6/19.
//  Copyright © 2019 Jake Caccamo. All rights reserved.
//

import SwiftUI
import Firebase

struct ChatView: View {
    let db = Firestore.firestore()
    var userToChat : UserModel
    @State var messageToSend = ""
    @ObservedObject var chatStore = ChatStore()
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(chatStore.chatArray) { chat in
                    ChatRow(chatMessage: chat, userToChat: self.userToChat)
                }
            }
            Spacer()
            HStack {
                TextField("Compose message...", text: $messageToSend).padding()
                Button(action: sendMessage) {
                    Text("Send")
                    }.padding()
            }
        }
    }
    
    func sendMessage() {
        var ref : DocumentReference? = nil
        let myChatDictionary : [String : Any] = ["chatUserFrom": Auth.auth().currentUser!.uid, "chatUserTo": userToChat.uidFirebase, "date": generateDate(), "message": self.messageToSend]
        ref = self.db.collection("Chats").addDocument(data: myChatDictionary, completion: { (error) in
            if error != nil {
                
            }
            else {
                self.messageToSend = ""
            }
        })
    }
    
    func generateDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy_MM_dd_hh_mm_ss"
        return (formatter.string(from: Date()) as NSString) as String
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(userToChat: UserModel(id: 0, name: "Jake", uidFirebase: "abc"))
    }
}
