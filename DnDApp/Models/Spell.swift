//
//  Spell.swift
//  DnDApp
//
//  Created by Max Magill on 02/12/2020.
//

import Foundation

struct Spell{
    var name: String
    var level: Int
    var School: String
    var castTime: String
    var range: String
    var components: String //enum?
    var duration: String
    var ritual: Bool
    var description: String
    
}

#if DEBUG
let testData = [
    Spell(name: "Fire bolt", level: 1, School: "Evocation", castTime: "1 action", range: "120 ft", components: "V S", duration: "Instant", ritual: false, description: "You hurl a mote of fire at a creature or object within range. Make a ranged spell attack against the target. On a hit, the target takes 1d10 fire damage. A flammable object hit by this spell ignites if it isn't being worn or carried. This spell's damage increases by 1d10 when you reach 5th level (2d10), 11th level (3d10), and 17th level (4d10)."),
    Spell(name: "Aid", level: 2, School: "Abjuration", castTime: "1 action", range: "30 ft", components: "V S M (a tiny strip of white cloth)", duration: "8 Hours", ritual: false, description: "Your spell bolsters your allies with toughness and resolve. Choose up to three creatures within range. Each target's hit point maximum and current hit points increase by 5 for the duration.  At Higher Levels when you cast this spell using a spell slot of 3rd level or higher, a target's hit points increase by an additional 5 for each slot level above 2nd.")
]
#endif
