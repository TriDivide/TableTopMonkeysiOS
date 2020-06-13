//
//  UserModel.swift
//  TTMonkeys
//
//  Created by Liam Smith on 03/06/2020.
//  Copyright © 2020 TriDivide. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class UserModel {
    
    static let instance: UserModel = UserModel()
    
    private let userRef = Firestore.firestore().collection("users")

    private var userFirebaseListener: ListenerRegistration?
    private var protectedUserFirebaseListener: ListenerRegistration?
    
    private var userHandlers = [UserHandler]()
    private var protectedUserHandlers = [ProtectedUserHandler]()
    
    private var mUser: User?
    private var mProtectedUser: ProtectedUser?
        
    
    public func getUserId() -> String? {
        return Auth.auth().currentUser?.uid
    }
    
    public func doLogin(email: String, password: String, completion: @escaping(Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { _, error in
                completion(error)
        }
        
    }
    
    public func doSignUp(email: String, firstName: String, lastName: String, password: String, completion: @escaping(Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { _, error in
            if let error = error {
                completion(error)
            }
            
            else if let userId = Auth.auth().currentUser?.uid {
                var dataSetCount = 0
                let inviteCode = String(UUID().uuidString.prefix(8))
                let user = User(userId: userId, firstName: firstName, lastName: lastName)
                let protectedUser = ProtectedUser(userId: userId, inviteCode: inviteCode, notificationTokens: nil, campaignIds: nil, email: email)
                
                self.setUserData(user: user, completion: { userError in
                    dataSetCount += 1
                    if dataSetCount == 2 {
                        completion(userError)
                    }
                })
                
                self.setProtectedUserData(protectedUser: protectedUser, completion: { protectedUserError in
                    dataSetCount += 1
                    if dataSetCount == 2 {
                        completion(protectedUserError)
                    }
                })
                
            }
        }
    }
    
    
    public func doLogout(completion: @escaping(Error?) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(nil)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
            completion(signOutError)
        }
    }
    
    public func addUserHandler(handler: UserHandler) {
        if let userId = self.getUserId() {
            if userHandlers.count > 0 {
                self.userHandlers.append(handler)
                handler.callback(mUser, nil)
            }
            else {
                self.userHandlers = [handler]
                let firebaseListener = userRef.document(userId).addSnapshotListener() {(DocumentSnapshot, error) in
                    if let error = error {
                        self.handleUserSnapshot(user: nil, error: error)
                    }
                }
                self.userFirebaseListener = firebaseListener
                
            }
        }
    }
    
    private func handleUserSnapshot(user: User?, error: Error?) {
        for handler in self.userHandlers {
            handler.callback(user, error)
        }
    }
    
    public func removeUserHandler() {
        
    }
    
    public func setUserData(user: User, completion: @escaping(Error?) -> Void) {
        userRef.document(user.userId).setData(map(user: user), merge: true) { err in
            completion(err)
        }
    }
    
    private func map(user: User) -> [String: Any] {
        var map = [String: Any]()
        map["firstName"] = user.firstName
        map["lastName"] = user.lastName
        
        return map

    }
    
    // MARK: Private Section
    
    private func getProtectedUserRef() -> CollectionReference? {
        if let userId = getUserId() {
            return userRef.document(userId).collection("protected")
        }
        else {
            return nil
        }
    }
    
    public func addProtectedUserHandler() {
        
    }
    
    public func removeProtectedUserHandler() {
        
    }
    
    public func setProtectedUserData(protectedUser: ProtectedUser, completion: @escaping(Error?) -> Void) {
        getProtectedUserRef()?.document("userProtected").setData(map(protectedUser: protectedUser), merge: true) { err in
            completion(err)
        }
    }
    
    private func map(protectedUser: ProtectedUser) -> [String: Any] {
        var map = [String: Any]()
        map["email"] = protectedUser.email
        map["campaignIds"] = protectedUser.campaignIds
        map["inviteCode"] = protectedUser.inviteCode
        map["notificationTokens"] = protectedUser.notificationTokens
        
        return map
    }
}
