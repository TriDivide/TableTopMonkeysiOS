//
//  Lore.swift
//  TTMonkeys
//
//  Created by Liam Smith on 07/06/2020.
//  Copyright © 2020 TriDivide. All rights reserved.
//

import Foundation


struct Lore {
    let id: String
    var type: LoreObjectType
    var name: String
    var imageDownloadUrl: String?
    var imageStorageLocation: String?   // The location in storage where the image is located. Used for deleting
    var description: String?
    var unlocked: Bool              // This is for if you want to prepare items in advanced but don't want the pslayers to see them until they have been descovered.
}
