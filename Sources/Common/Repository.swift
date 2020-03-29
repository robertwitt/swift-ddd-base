//
//  Repository.swift
//  
//
//  Created by Witt, Robert on 27.03.20.
//

import Foundation

/**
 Repository to manage access to aggregate roots
 */
@available(OSX 10.15, *)
protocol Repository {
    
    associatedtype R: AggregateRoot
    
    /**
     Get an aggregate root by its ID
     - Parameter byId: ID of a root entity
     - Returns: aggregate root or `nil` if not found
     */
    func get(byId id: R.ID) -> R?
    
    /**
     Save a root entity
     - Parameter _: the root entity to be saved
     */
    func save(_ aggregateRoot: R)
    
}
