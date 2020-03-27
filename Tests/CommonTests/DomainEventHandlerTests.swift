//
//  DomainEventHandlerTests.swift
//  
//
//  Created by Witt, Robert on 27.03.20.
//

import XCTest
@testable import Common

final class DomainEventHandlerTests: XCTestCase {
    
    class SampleEvent: DomainEvent {
        var handled = false
    }

    class SampleEventHandler: DomainEventHandler {
        
        typealias T = SampleEvent
        
        func handle(_ domainEvent: SampleEvent) {
            domainEvent.handled = true
        }
        
    }

    static var allTests = [
        ("testHandleEvent", testHandleEvent),
    ]
    
    func testHandleEvent() {
        let event = SampleEvent()
        let handler = SampleEventHandler()
        handler.handle(event)
        XCTAssert(event.handled)
    }

}
