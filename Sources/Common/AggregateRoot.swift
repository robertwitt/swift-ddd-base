//
//  AggregateRoot.swift
//  
//
//  Created by Witt, Robert on 27.03.20.
//

import Foundation

/**
 An root entity in a domain aggregate. This protocol is supposed to be sub classed into concrete entities.
 */
@available(OSX 10.15, *)
protocol AggregateRoot: Entity {
    
    /// List of domain events
    var domainEvents: [DomainEvent] { get }
    
    /**
     Add a domain event to this root
     - Parameter event: a domain event
     */
    func addDomainEvent(_ domainEvent: DomainEvent)
    
    /**
     Clear the list of domain events
     */
    func clearDomainEvents()
    
}
