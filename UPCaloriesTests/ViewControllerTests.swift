//
//  ViewControllerTests.swift
//  UPCalories
//
//  Created by Emma Lee-Choon on 25/01/2016.
//  Copyright © 2016 Emma Lee-Choon. All rights reserved.
//

import XCTest
import UPPlatformSDK
@testable import UPCalories

private class MockUserToken: UserToken {
    
    var didCallAddUserToken: Bool = false
    
    override private func addUserToken(token: String) {
        didCallAddUserToken = true
    }
    
}

class ViewControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testViewDidAppearCallsApiStartSession() {
        let mockSession = UPSession.init(token: "TestUserToken")
        let mockPlatform = MockPlatform(session: mockSession, error: nil)
        let api = Api.init(withPlatform:mockPlatform)
        let mockUserToken = MockUserToken(withUserDefaults: MockNSUserDefaults(suiteName: "Testing")!)
        let viewController = ViewController()
        viewController.api = api
        viewController.userToken = mockUserToken
        viewController.viewDidAppear(true)
        XCTAssertTrue(mockPlatform.didCallStartSession)
    }
    
    func testViewDidAppearStartSessionWithSuccessfulResponseAddsUserToken() {
        let mockSession = UPSession.init(token: "TestUserToken")
        let mockPlatform = MockPlatform(session: mockSession, error: nil)
        let api = Api.init(withPlatform:mockPlatform)
        let mockUserToken = MockUserToken(withUserDefaults: MockNSUserDefaults(suiteName: "Testing")!)
        let viewController = ViewController()
        viewController.api = api
        viewController.userToken = mockUserToken
        viewController.viewDidAppear(true)
        XCTAssertTrue(mockUserToken.didCallAddUserToken)
    }

    func testViewDidAppearStartSessionWithErrorResponse() {
        let mockSession = UPSession.init(token: "")
        let mockError = NSError(domain: "Test", code: -1, userInfo: nil)
        let mockPlatform = MockPlatform(session: mockSession, error: mockError)
        let api = Api.init(withPlatform:mockPlatform)
        let mockUserToken = MockUserToken(withUserDefaults: MockNSUserDefaults(suiteName: "Testing")!)
        let viewController = ViewController()
        viewController.api = api
        viewController.userToken = mockUserToken
        viewController.viewDidAppear(true)
        XCTAssertFalse(mockUserToken.didCallAddUserToken)
    }
}
