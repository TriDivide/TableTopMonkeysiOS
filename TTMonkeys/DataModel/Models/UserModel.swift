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
        
    
    public func getUserId() -> String? {
        return Auth.auth().currentUser?.uid
    }
    
    public func doLogin(email: String, password: String, completion: @escaping(Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { _, error in
                completion(error)
        }
        
    }
    
    public func doSignUp(user: User, protectedUser: ProtectedUser, password: String, completion: @escaping(Error?) -> Void) {
        Auth.auth().createUser(withEmail: user.email, password: password) { authResult, error in
            if let error = error {
                completion(error)
            }
            
            else if let auth = authResult {
                
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
