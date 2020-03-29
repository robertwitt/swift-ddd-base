//
//  Entity.swift
//  
//
//  Created by Witt, Robert on 27.03.20.
//

import Foundation

/**
 An abstract domain entity. This protocol is supposed to be sub classed into concrete entities.
 */
@available(OSX 10.15, *)
protocol Entity: Hashable, Identifiable {
    /**
     Initializer for an entity
     - Parameter id: the identifier of this entity
     */
    init(id: ID)
}

@available(OSX 10.15, *)
extension Entity {
    func hash(into hasher: inout Hasher) {
        id.hash(into: &hasher)
    }
}
