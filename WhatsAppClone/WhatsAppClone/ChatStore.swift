//
//  ChatStore.swift
//  WhatsAppClone
//
//  Created by Jake Caccamo on 12/6/19.
//  Copyright © 2019 Jake Caccamo. All rights reserved.
//

import SwiftUI
import Firebase
import Combine

class ChatStore : ObservableObject {
    let db = Firestore.firestore()
    var chatArray : [ChatModel] = []
    
    var objectWillChange = PassthroughSubject<Array<Any>, Never>()
    
    init() {
        db.collection("Chats").whereField("chatUserFrom", isEqualTo: Auth.auth().currentUser!.uid).addSnapshotListener { (snapshot, error) in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                self.chatArray.removeAll(keepingCapacity: false)
                for doc in snapshot!.documents {
                    let chatUIDFromFB = doc.documentID
                    if let chatMessage = doc.get("message") as? String {
                        if let messageFrom = doc.get("chatUserFrom") as? String {
                            if let messageTo = doc.get("chatUserTo") as? String {
                                if let dateString = doc.get("date") as? String {
                                    let dateFormatter = DateFormatter()
                                    dateFormatter.dateFormat = "yyyy_MM_dd_hh_mm_ss"
                                    let dateFromFB = dateFormatter.date(from: dateString)
                                    let currentIndex = self.chatArray.last?.id
                                    let createdChat = ChatModel(id: (currentIndex ?? -1) + 1, message: chatMessage, uidFromFirebase: chatUIDFromFB, messageTo: messageTo, messageFrom: messageFrom, messageDate: dateFromFB!, messageFromMe: true)
                                    self.chatArray.append(createdChat)
                                }
                            }
                        }
                    }
                }
                self.db.collection("Chats").whereField("chatUserTo", isEqualTo: Auth.auth().currentUser!.uid).addSnapshotListener { (snapshot, error) in
                    if error != nil {
                        print(error?.localizedDescription)
                    } else {
                        for doc in snapshot!.documents {
                            let chatUIDFromFB = doc.documentID
                            if let chatMessage = doc.get("message") as? String {
                                if let messageFrom = doc.get("chatUserFrom") as? String {
                                    if let messageTo = doc.get("chatUserTo") as? String {
                                        if let dateString = doc.get("date") as? String {
                                            let dateFormatter = DateFormatter()
                                            dateFormatter.dateFormat = "yyyy_MM_dd_hh_mm_ss"
                                            let dateFromFB = dateFormatter.date(from: dateString)
                                            let currentIndex = self.chatArray.last?.id
                                            let createdChat = ChatModel(id: (currentIndex ?? -1) + 1, message: chatMessage, uidFromFirebase: chatUIDFromFB, messageTo: messageTo, messageFrom: messageFrom, messageDate: dateFromFB!, messageFromMe: true)
                                            self.chatArray.append(createdChat)
                                        }
                                    }
                                }
                            }
                        }
                        self.chatArray = self.chatArray.sorted(by: {
                            $0.messageDate.compare($1.messageDate) == .orderedAscending
                        })
                        self.objectWillChange.send(self.chatArray)
                    }
                }
            }
        }
    }
}
