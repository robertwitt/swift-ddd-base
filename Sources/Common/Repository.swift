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
protocol Repository {
    
    associatedtype T
    
    /**
     Get an aggregate root by its ID
     - Parameter byId: ID of a root entity
     - Returns: aggregate root or `nil` if not found
     */
    func get(byId id: EntityId) -> T?
    
    /**
     Save a root entity
     - Parameter _: the root entity to be saved
     */
    func save(_ aggregateRoot: T)
    
}

extension Repository where T == AggregateRoot {}
