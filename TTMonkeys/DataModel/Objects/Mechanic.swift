//
//  Mechanic.swift
//  TTMonkeys
//
//  Created by Liam Smith on 07/06/2020.
//  Copyright © 2020 TriDivide. All rights reserved.
//

import Foundation

struct Mechanic {
    let id: String
    var name: String
    var type: MechanicType
    var description: String?
    var level: Int?     // If a mechanic has a level or ranking system, then this denotes the current level. An example being a faction has reputation levels, 0 being neutral and 3 being revered.
    var levelDescriptor: String?    // An attribute that describes the level/Rank of the mechanic, eg: if your level is 1 and it is a reputation rank then the descriptor would be Friendly.
    var value: Any?
    var valueRequiredToLevel: Int?      // Denotes how much progress the player needs to increase their level/rank, if available. This should scale according to level.
    let canDeIncrement: Bool?
    
    
    
}
