//
//  Specification.swift
//  
//
//  Created by Witt, Robert on 21.06.20.
//

import Foundation

/**
 A generic specification to define and test business rules
 */
protocol Specification {
    
    associatedtype T: Any
    
    /**
     Test wether this specification is satisfied
     - Parameter object: the candidate to test the specification on
     - Returns: `true` if test is successful, `false` otherwise
     */
    func isSatisfied(candidate: T) -> Bool
    
}

