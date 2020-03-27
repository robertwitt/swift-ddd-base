//
//  DomainRepository.swift
//  
//
//  Created by Witt, Robert on 27.03.20.
//

import Foundation

/**
 Repository to manage access to root entities
 */
protocol DomainRepository {
    
    associatedtype T
    
    /**
     Get a root entity by its ID
     - Parameter byId: ID of a root entity
     - Returns: root entity or `nil` if not found
     */
    func get(byId id: DomainEntityId) -> T?
    
    /**
     Save a root entity
     - Parameter _: the root entity to be saved
     */
    func save(_ rootEntity: T)
    
}

extension DomainRepository where T == DomainRootEntity {}
