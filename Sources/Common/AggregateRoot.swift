//
//  AggregateRoot.swift
//  
//
//  Created by Witt, Robert on 27.03.20.
//

import Foundation

/**
 An root entity in a domain aggregate. This class is supposed to be sub classed into concrete entities.
 */
class AggregateRoot: Entity {
    
    /// List of domain events
    private(set) var domainEvents = [DomainEvent]()
    
    /**
     Add a domain event to this root
     - Parameter event: a domain event
     */
    func addDomainEvent(_ domainEvent: DomainEvent) {
        domainEvents.append(domainEvent)
    }
    
    /**
     Clear the list of domain events
     */
    func clearDomainEvents() {
        domainEvents.removeAll()
    }
    
}
