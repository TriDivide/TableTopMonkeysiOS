//
//  ModelErrors.swift
//  TTMonkeys
//
//  Created by Liam Smith on 13/06/2020.
//  Copyright © 2020 TriDivide. All rights reserved.
//

import Foundation


extension RegistrationError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidName:
            return NSLocalizedString("The name you submitted was invalid", comment: "Invalid Name")
        case .invalidEmail:
            return NSLocalizedString("The email you submitted was invalid", comment: "Invalid Email")
        case .invalidPassword:
            return NSLocalizedString("The password you submitted was invalid", comment: "Invalid Password")
        case .invalidPin:
            return NSLocalizedString("The PIN you submitted was invalid", comment: "Invalid Pin")
        case .passwordTooShort:
                return NSLocalizedString("The password you submitted too short.", comment: "Password Too Short")
        }
    }
}

extension GenericError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unableToSendMessage:
            return NSLocalizedString("Unable to send a message at this time, please try again later", comment: "Unable To Send Message")
        
        case .unableToRemoveFromPending:
            return NSLocalizedString("Unable to remove user from pending", comment: "unable to remove from pending")
            
        case .unableToMarkKeepsake:
            return NSLocalizedString("Unable to mark the item as a keepsake, please try again later", comment: "unable to mark as keepsake")
        
        case .unableToSendRequest:
            return NSLocalizedString("Unable to send a request at this time, please try again later", comment: "unable to send request")
        case .notAHubUser:
            return NSLocalizedString("This user is not a hub user.", comment: "Unable to retrieve Hub")
        }
    }
}

extension AuthError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .NotSignedIn:
            return NSLocalizedString("You are not currently signed in. Please sign in to continue", comment: "unable to continue")
        case .RequiresAuth:
            return NSLocalizedString("You need to re-enter you login detail to perform this action", comment: "RequiresAuth")
        case .FailedToUpdateEmail:
            return NSLocalizedString("Failed to update the email address", comment: "FailedToUpdateEmail")
        case .FauledToCreateAuthUser:
            return NSLocalizedString("Failed to create user.", comment: "FailedToCreateUser")
        }
    }
}
extension ModelError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidUserData:
            return NSLocalizedString("This user's data is invalid", comment: "Error constructing User object")
        case .invalidDiaryEntryData:
            return NSLocalizedString("This diary entry's data is invalid", comment: "Error constructing Diary Entry object")
        case .invalidHubData:
            return NSLocalizedString("This hub object's data is invalid", comment: "Error constructing Hub Object")
        case .invalidGalleryData:
            return NSLocalizedString("This gallery object's data is invalid", comment: "Error constructing Gallery Object")
        case .invalidUserProfileData:
            return NSLocalizedString("This User Profile's data is invalid", comment: "Error constructing UserProfile Object")
        case .invalidChatEntryData:
            return NSLocalizedString("ChatEntry data is invalid", comment: "Error constructing ChatEntry Object")
        case .invalidMediaEntryData:
            return NSLocalizedString("MediaEntry data is invalid", comment: "Error constructing MediaEntry Object")
        case .invalidChatRoom:
            return NSLocalizedString("ChatRoom is invalid", comment: "Error constructing ChatRoom Object")
        case .uploadTimedOut :
            return NSLocalizedString("Uploading media took longer than expected. Please try again later.", comment: "Error uploading media")
        case .unableToProcessKeys:
            return NSLocalizedString("Unable to subscribe with the licence key provided. Please contact customer support.", comment: "Error subscribing")
        case .missingUserData:
            return NSLocalizedString("Missing user data.", comment: "NoUserData")
        case .unableToUpdateUser:
            return NSLocalizedString("Unable to update user data at this time. Please try again later", comment: "Unable to update user")
        case .invalidCallData:
            return NSLocalizedString("The call data is invalid", comment: "InvalidCallData")
        case .invalidInviteData:
            return NSLocalizedString("The Invite data is invalid", comment: "InvalidInviteData")
        case .unableToRetrieveDownloadUrl:
            return NSLocalizedString("Unable to retrieve the downloadUrl for media", comment: "UnableToRetrieveDownloadURL")
        }
    }
}

enum RegistrationError: Error {
    case invalidEmail
    case invalidPassword
    case invalidName
    case invalidPin
    case passwordTooShort
}

enum GenericError: Error {
    case unableToSendMessage
    case unableToRemoveFromPending
    case unableToMarkKeepsake
    case unableToSendRequest
    case notAHubUser
}

enum AuthError: Error {
    case NotSignedIn
    case FailedToUpdateEmail
    case RequiresAuth
    case FauledToCreateAuthUser
}

enum ModelError: Error {
    case invalidUserData
    case invalidDiaryEntryData
    case invalidHubData
    case invalidGalleryData
    case invalidUserProfileData
    case invalidChatEntryData
    case invalidMediaEntryData
    case invalidChatRoom
    case uploadTimedOut
    case unableToProcessKeys
    case missingUserData
    case unableToUpdateUser
    case invalidCallData
    case invalidInviteData
    case unableToRetrieveDownloadUrl
}
