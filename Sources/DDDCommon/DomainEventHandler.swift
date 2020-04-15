//
//  DomainEventHandler.swift
//  
//
//  Created by Witt, Robert on 27.03.20.
//

import Foundation

/**
 Handler of domain events of a specific sub type of `DomainEvent`
 */
public protocol DomainEventHandler {
    
    associatedtype E: DomainEvent
    
    /**
     Handle a single domain event
     - Parameter domainEvent: a domain event
     */
    func handle(_ domainEvent: E)
    
}
