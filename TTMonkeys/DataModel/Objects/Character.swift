//
//  Character.swift
//  TTMonkeys
//
//  Created by Liam Smith on 07/06/2020.
//  Copyright © 2020 TriDivide. All rights reserved.
//

import Foundation

struct Character {
    let id: String
    var name: String
    var imageDownloadUrl: String?
    var imageStorageLocation: String?
    let ownerId: String
    let race: Race
    let characterClass: Class
    var experience: Int
    var level: Int
    var status: CharacterStatus
}
