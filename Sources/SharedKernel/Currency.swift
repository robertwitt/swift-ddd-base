//
//  Currency.swift
//  
//
//  Created by Witt, Robert on 28.03.20.
//

@testable import Common

/**
 A currency value object
 */
struct Currency: ValueObject {
    
    /// Code of this currency
    let code: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(code)
    }
    
    static func == (lhs: Currency, rhs: Currency) -> Bool {
        return lhs.code == rhs.code
    }
    
    /// Euro
    static let EUR = Currency(code: "EUR")
    
    /// British pound
    static let GBP = Currency(code: "GBP")
    
    /// US Dollar
    static let USD = Currency(code: "USD")
    
}
