//
//  ApiTests.swift
//  UPCalories
//
//  Created by Emma Lee-Choon on 25/01/2016.
//  Copyright © 2016 Emma Lee-Choon. All rights reserved.
//

import XCTest
import UPPlatformSDK
@testable import UPCalories

class ApiTests: XCTestCase {
    
    func testStartSessionCall() {
        let mockSession = UPSession.init(token: "TestUserToken")
        let mockError = NSError(domain: "Test", code: -1, userInfo: nil)
        let mockPlatform = MockPlatform(session: mockSession, error: mockError)
        let api = Api(withPlatform: mockPlatform)
        api.startSessionWith { (session, error) -> () in
        }
        XCTAssertTrue(mockPlatform.didCallStartSession)
    }
    
    func testStartSessionResponse() {
        let mockSession = UPSession.init(token: "TestUserToken")
        let mockError = NSError(domain: "Test", code: -1, userInfo: nil)
        let mockPlatform = MockPlatform(session: mockSession, error: mockError)
        let api = Api(withPlatform: mockPlatform)
        api.startSessionWith { (session, error) -> () in
            XCTAssertEqual(session, mockSession)
            XCTAssertEqual(error, mockError)
        }
    }
    
}
