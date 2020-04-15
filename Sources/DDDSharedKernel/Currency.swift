//
//  Currency.swift
//  
//
//  Created by Witt, Robert on 28.03.20.
//

import Foundation
import DDDCommon

/**
 A currency value object
 */
public struct Currency: ValueObject {
    
    /// Code of this currency
    public let code: String
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(code)
    }
    
    public static func == (lhs: Currency, rhs: Currency) -> Bool {
        return lhs.code == rhs.code
    }
    
    /// Euro
    public static let EUR = Currency(code: "EUR")
    
    /// British pound
    public static let GBP = Currency(code: "GBP")
    
    /// US Dollar
    public static let USD = Currency(code: "USD")
    
}
