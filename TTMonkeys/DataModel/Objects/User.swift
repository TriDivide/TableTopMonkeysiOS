//
//  User.swift
//  TTMonkeys
//
//  Created by Liam Smith on 03/06/2020.
//  Copyright © 2020 TriDivide. All rights reserved.
//

import Foundation

struct ProtectedUser {
    let userId: String
    var inviteCode: String
    var notificationTokens: [String]?
    var campaignIds: [String]?
    var email: String
}

struct User {
    let userId: String
    var firstName: String
    var lastName: String
}

