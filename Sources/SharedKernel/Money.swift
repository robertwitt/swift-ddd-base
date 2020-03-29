//
//  Money.swift
//  
//
//  Created by Witt, Robert on 29.03.20.
//

import Foundation
@testable import Common

struct Money: ValueObject, Comparable {
    
    let amount: Double
    let currency: Currency
    
    init(_ amount: Double, currency: Currency) {
        self.amount = amount
        self.currency = currency
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(amount)
        hasher.combine(currency)
    }
    
    static func == (lhs: Money, rhs: Money) -> Bool {
        return lhs.amount == rhs.amount && lhs.currency == rhs.currency
    }
    
    static func < (lhs: Money, rhs: Money) -> Bool {
        return lhs.amount < rhs.amount && lhs.currency == rhs.currency
    }
    
    static func <= (lhs: Money, rhs: Money) -> Bool {
        return lhs.amount <= rhs.amount && lhs.currency == rhs.currency
    }
    
    static func > (lhs: Money, rhs: Money) -> Bool {
        return lhs.amount > rhs.amount && lhs.currency == rhs.currency
    }
    
    static func >= (lhs: Money, rhs: Money) -> Bool {
        return lhs.amount >= rhs.amount && lhs.currency == rhs.currency
    }
    
    static func + (lhs: Money, rhs: Money) throws -> Money {
        guard lhs.currency == rhs.currency else {
            throw NSError(domain: SharedKernelErrorDomain,
                          code: SharedKernelErrorCodeUnmatchingCurrencies,
                          userInfo: [NSLocalizedDescriptionKey: "Currencies must match to perform this operation."])
        }
        return Money(lhs.amount + rhs.amount, currency: lhs.currency)
    }
    
    static func - (lhs: Money, rhs: Money) throws -> Money {
        guard lhs.currency == rhs.currency else {
            throw NSError(domain: SharedKernelErrorDomain,
                          code: SharedKernelErrorCodeUnmatchingCurrencies,
                          userInfo: [NSLocalizedDescriptionKey: "Currencies must match to perform this operation."])
        }
        return Money(lhs.amount - rhs.amount, currency: lhs.currency)
    }
    
    static func * (money: Money, multiplier: Double) -> Money {
        return Money(money.amount * multiplier, currency: money.currency)
    }
    
    func canAllocate(amount: Double) -> Bool {
        return self.amount >= amount
    }
    
    func allocate(amount: Double) throws -> Money {
        guard canAllocate(amount: amount) else {
            throw NSError(domain: SharedKernelErrorDomain,
                          code: SharedKernelErrorCodeCannotAllocate,
                          userInfo: [NSLocalizedDescriptionKey: "Amount cannot be allocated."])
        }
        return Money(amount, currency: currency)
    }
    
}
