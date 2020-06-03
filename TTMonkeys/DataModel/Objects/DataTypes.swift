//
//  DataTypes.swift
//  TTMonkeys
//
//  Created by Liam Smith on 03/06/2020.
//  Copyright © 2020 TriDivide. All rights reserved.
//

import Foundation


enum LoreObjectType: Int {
    case Person = 0
    case Location = 1
    case Item = 2
    case Faction = 3
    case Misc = 4
}

enum MechanicType: Int {
    case TextInput = 0
    case NumberInput = 1
    case IncrementalCounter = 2
}

enum CharacterStatus: Int {
    case Alive = 0
    case Dead = 1
}

enum Race: Int {
    case Dwarf = 0
    case Elf = 1
    case Halfling = 2
    case Human = 3
    case Dragonborn = 4
    case Gnome = 5
    case HalfElf = 6
    case HalfOrc = 7
    case Tiefling = 8
    
    func name() -> String {
        switch self {
        case .Dwarf:
            return "Dwarf"
        case .Elf:
            return "Elf"
        case .Halfling:
            return "Halfling"
        case .Human:
            return "Human"
        case .Dragonborn:
            return "Dragonborn"
        case .Gnome:
            return "Gnome"
        case .HalfElf:
            return "Half Elf"
        case .HalfOrc:
            return "Half Orc"
        case .Tiefling:
            return "Tiefling"
        }
    }
}

enum Class: Int {
    case Barbarian = 0
    case Bard = 1
    case Cleric = 2
    case Druid = 3
    case Fighter = 4
    case Monk = 5
    case Paladin = 6
    case Ranger = 7
    case Rogue = 8
    case Sorcerer = 9
    case Warlock = 10
    case Wizard = 11
    
    func name() -> String {
        switch self {
        case .Barbarian:
            return "Barbarian"
        case .Bard:
            return "Bard"
        case .Cleric:
            return "Cleric"
        case .Druid:
            return "Druid"
        case .Fighter:
            return "Fighter"
        case .Monk:
            return "Monk"
        case .Paladin:
            return "Paladin"
        case .Ranger:
            return "Ranger"
        case .Rogue:
            return "Rogue"
        case .Sorcerer:
            return "Sorcerer"
        case .Warlock:
            return "Warlock"
        case .Wizard:
            return "Wizard"
        }
    }
}



