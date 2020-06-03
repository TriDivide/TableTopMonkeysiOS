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
    
    // private var userHandlers = [UserHandler]()
    // private var protectedUserHandlers = [ProtectedUserHandler]()
    
    public func getUserId() -> String? {
        return Auth.auth().currentUser?.uid
    }
    
    public func doLogin() {
        
    }
    
    public func doSignUp() {
        
    }
    
    public func doLogout() {
        
    }
    
    public func addUserHandler() {
        
    }
    
    public func removeUserHandler() {
        
    }
    
    public func setUserData() {
        
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
    
    public func setProtectedUserData() {
        
    }
}
