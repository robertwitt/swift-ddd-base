//
//  Money.swift
//  
//
//  Created by Witt, Robert on 29.03.20.
//

import Foundation
import DDDCommon

public struct Money: ValueObject, Comparable {
    
    public let amount: Double
    public let currency: Currency
    
    public init(_ amount: Double, currency: Currency) {
        self.amount = amount
        self.currency = currency
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(amount)
        hasher.combine(currency)
    }
    
    public static func == (lhs: Money, rhs: Money) -> Bool {
        return lhs.amount == rhs.amount && lhs.currency == rhs.currency
    }
    
    public static func < (lhs: Money, rhs: Money) -> Bool {
        return lhs.amount < rhs.amount && lhs.currency == rhs.currency
    }
    
    public static func <= (lhs: Money, rhs: Money) -> Bool {
        return lhs.amount <= rhs.amount && lhs.currency == rhs.currency
    }
    
    public static func > (lhs: Money, rhs: Money) -> Bool {
        return lhs.amount > rhs.amount && lhs.currency == rhs.currency
    }
    
    public static func >= (lhs: Money, rhs: Money) -> Bool {
        return lhs.amount >= rhs.amount && lhs.currency == rhs.currency
    }
    
    public static func + (lhs: Money, rhs: Money) throws -> Money {
        guard lhs.currency == rhs.currency else {
            throw NSError(domain: SharedKernelErrorDomain,
                          code: SharedKernelErrorCodeUnmatchingCurrencies,
                          userInfo: [NSLocalizedDescriptionKey: "Currencies must match to perform this operation."])
        }
        return Money(lhs.amount + rhs.amount, currency: lhs.currency)
    }
    
    public static func - (lhs: Money, rhs: Money) throws -> Money {
        guard lhs.currency == rhs.currency else {
            throw NSError(domain: SharedKernelErrorDomain,
                          code: SharedKernelErrorCodeUnmatchingCurrencies,
                          userInfo: [NSLocalizedDescriptionKey: "Currencies must match to perform this operation."])
        }
        return Money(lhs.amount - rhs.amount, currency: lhs.currency)
    }
    
    public static func * (money: Money, multiplier: Double) -> Money {
        return Money(money.amount * multiplier, currency: money.currency)
    }
    
    public func canAllocate(amount: Double) -> Bool {
        return self.amount >= amount
    }
    
    public func allocate(amount: Double) throws -> Money {
        guard canAllocate(amount: amount) else {
            throw NSError(domain: SharedKernelErrorDomain,
                          code: SharedKernelErrorCodeCannotAllocate,
                          userInfo: [NSLocalizedDescriptionKey: "Amount cannot be allocated."])
        }
        return Money(amount, currency: currency)
    }
    
}
