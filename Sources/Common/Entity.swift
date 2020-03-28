//
//  Entity.swift
//  
//
//  Created by Witt, Robert on 27.03.20.
//

import Foundation

/**
 An abstract domain entity. This class is supposed to be sub classed into concrete entities.
 */
class Entity: Hashable {
    
    /// Unique identifier of this entity
    let id: EntityId
    
    /**
     Initializer for an entity
     - Parameter id: the identifier of this entity
     */
    public init(id: EntityId) {
        self.id = id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Entity, rhs: Entity) -> Bool {
        return lhs.id == rhs.id
    }
    
}

/// ID of a domain entity
typealias EntityId = String
