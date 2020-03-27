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
protocol DomainEventHandler {
    
    associatedtype T
    
    /**
     Handle a single domain event
     - Parameter domainEvent: a domain event
     */
    func handle(_ domainEvent: T)
    
}

extension DomainEventHandler where T == DomainEvent {}
