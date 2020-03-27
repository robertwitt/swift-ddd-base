//
//  DomainEntity.swift
//  
//
//  Created by Witt, Robert on 27.03.20.
//

import Foundation

/**
 An abstract domain entity. This class is supposed to be sub classed into concrete entities.
 */
class DomainEntity: Hashable {
    
    /// Unique identifier of this entity
    let id: DomainEntityId
    
    /**
     Initializer for an entity
     - Parameter id: the identifier of this entity
     */
    public init(id: DomainEntityId) {
        self.id = id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: DomainEntity, rhs: DomainEntity) -> Bool {
        return lhs.id == rhs.id
    }
    
}

/// ID of a domain entity
typealias DomainEntityId = String
