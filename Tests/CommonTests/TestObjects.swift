//
//  File.swift
//  
//
//  Created by Witt, Robert on 29.03.20.
//

import Foundation
@testable import Common

@available(OSX 10.15, *)
class Person: Entity {
    
    typealias ID = String
    
    private(set) var id: String
    var name: String?
    
    required init(id: String) {
        self.id = id
    }
    
    func sayHello() -> String {
        return "Hi, my name is \(name ?? id)"
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.id == rhs.id
    }
}

@available(OSX 10.15, *)
class Customer: AggregateRoot {
    
    typealias ID = String
    
    private(set) var id: String
    var name: String?
    
    required init(id: String) {
        self.id = id
    }
    
    var domainEvents: [DomainEvent] {
        get {
            return events
        }
    }
    
    private var events = [DomainEvent]()
    
    func addDomainEvent(_ domainEvent: DomainEvent) {
        events.append(domainEvent)
    }
    
    func clearDomainEvents() {
        events.removeAll()
    }
    
    static func == (lhs: Customer, rhs: Customer) -> Bool {
        return lhs.id == rhs.id
    }
}

class CustomerEvent: DomainEvent {}

@available(OSX 10.15, *)
class CustomerRepository: Repository {
    
    typealias R = Customer
    
    private var entities = ["": Customer(id: "")]
    
    func get(byId id: String) -> Customer? {
        return entities[id] ?? Customer(id: id)
    }
    
    func save(_ rootEntity: Customer) {
        entities[rootEntity.id] = rootEntity
    }
}

struct Currency: ValueObject {
    let code: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(code)
    }
    
    static func == (lhs: Currency, rhs: Currency) -> Bool {
        return lhs.code == rhs.code
    }
}
