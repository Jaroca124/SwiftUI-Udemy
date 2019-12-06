//
//  UserStore.swift
//  WhatsAppClone
//
//  Created by Jake Caccamo on 12/6/19.
//  Copyright © 2019 Jake Caccamo. All rights reserved.
//

import SwiftUI
import Firebase
import Combine

class UserStore : ObservableObject{
    let db = Firestore.firestore()
    
    var userArray : [UserModel] = []
    
    var objectWillChange = PassthroughSubject<Array<Any>, Never>()

    init() {
        db.collection("Users").addSnapshotListener { (snapshot, error) in
            if error != nil {
                //print(error?.localizedDescription)
            } else {
                self.userArray.removeAll(keepingCapacity: false)
                for doc in snapshot!.documents {
                    if let userIDFromFirebase = doc.get("uuid_firebase") as? String {
                        if let userName = doc.get("username") as? String {
                            let currentIndex = self.userArray.last?.id
                            let createdUser = UserModel(id: (currentIndex ?? -1) + 1, name: userName, uidFirebase: userIDFromFirebase)
                            self.userArray.append(createdUser)
                        }
                    }
                }
                self.objectWillChange.send(self.userArray)
            }
        }
    }
}
