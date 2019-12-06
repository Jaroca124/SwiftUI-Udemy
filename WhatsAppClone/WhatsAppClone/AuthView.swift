//
//  AuthView.swift
//  WhatsAppClone
//
//  Created by Jake Caccamo on 12/5/19.
//  Copyright © 2019 Jake Caccamo. All rights reserved.
//

import SwiftUI
import Firebase

struct AuthView: View {
    
    @State var userEmail = ""
    @State var userPassword = ""
    @State var userName = ""
    @State var showAuthView = false
    @State var showAuthError = false
    
    let db = Firestore.firestore()
    @ObservedObject var userStore = UserStore()
    
    var body: some View {
        NavigationView {
            if (!self.showAuthView) {
                List {
                    Text("WhatsApp Clone").font(.largeTitle).bold()
                    
                    Section {
                        VStack(alignment: .leading) {
                            SectionSubitle(subTitle: "User Email")
                            TextField("", text: $userEmail)
                        }
                    }
                    
                    Section {
                        VStack(alignment: .leading) {
                            SectionSubitle(subTitle: "User Password")
                            TextField("", text: $userPassword)
                        }
                        if (self.showAuthError) {
                            Text("Auth Error. Please try again...").font(.subheadline).foregroundColor(.red)
                        }
                    }
                    
                    Section {
                        VStack(alignment: .leading) {
                            SectionSubitle(subTitle: "User Name")
                            TextField("", text: $userName)
                        }
                    }
                    
                    Section {
                        HStack {
                            Spacer()
                            Button(action: {
                                Auth.auth().signIn(withEmail: self.userEmail, password: self.userPassword) { (result, error) in
                                    if error != nil {
                                        self.showAuthError = true
                                    } else {
                                        self.showAuthError = false
                                        self.showAuthView = true
                                    }
                                }
                            }) {
                                Text("Sign In")
                            }
                            Spacer()
                        }
                    }
                    
                    Section {
                        HStack {
                            Spacer()
                            Button(action: {
                                Auth.auth().createUser(withEmail: self.userEmail, password: self.userPassword) { (result, error) in
                                    if error != nil {
                                        self.showAuthError = true
                                    } else {
                                        self.showAuthError = false
                                        var ref: DocumentReference? = nil
                                        var myUserDictionary: [String : Any] = ["username": self.userName, "email": self.userEmail, "uuid_firebase": result!.user.uid]
                                        ref = self.db.collection("Users").addDocument(data: myUserDictionary, completion: { (error) in
                                            if error != nil {
                                                
                                            }
                                        })
                                        self.showAuthView = true;
                                    }
                                }
                            }) {
                                Text("Sign Up")
                            }
                            Spacer()
                        }
                    }
                }
            }
            else {
                NavigationView {
                    List(userStore.userArray) { user in
                        NavigationLink(destination: ChatView(userToChat: user)) {
                            Text(user.name)
                        }
                    }
                }.navigationBarTitle(Text("Chat With Users")).navigationBarItems(leading: Button(action: {
                    self.showAuthView = false
                    do {
                        try Auth.auth().signOut()
                    } catch {
                        
                    }
                }, label: {
                    Text("Logout")
                }))
            }
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AuthView(showAuthView: false)
            AuthView(showAuthView: true)
        }
    }
}

struct SectionSubitle : View {
    var subTitle : String
    var body: some View {
        Text(subTitle).font(.subheadline).foregroundColor(.gray)
    }
}
