//
//  DomainRootEntity.swift
//  
//
//  Created by Witt, Robert on 27.03.20.
//

import Foundation

/**
 The root entity in a domain aggregate.
 */
class DomainRootEntity: DomainEntity {
    
    /// List of domain events
    private(set) var domainEvents = [DomainEvent]()
    
    /**
     Add a domain event to this root entity
     - Parameter event: a domain event
     */
    func addDomainEvent(_ event: DomainEvent) {
        domainEvents.append(event)
    }
    
    /**
     Clear the list of domain events
     */
    func clearDomainEvents() {
        domainEvents.removeAll()
    }
    
}
