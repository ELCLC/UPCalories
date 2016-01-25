//
//  UserTokenTests.swift
//  UserTokenTests
//
//  Created by Emma Lee-Choon on 24/01/2016.
//  Copyright © 2016 Emma Lee-Choon. All rights reserved.
//

import XCTest
@testable import UPCalories

class UserTokenTests: XCTestCase {
    var mockUserDefaults: MockNSUserDefaults!
    var userToken: UserToken!
    
    override func setUp() {
        super.setUp()
        mockUserDefaults = MockNSUserDefaults(suiteName: "testing")!
        userToken = UserToken.init(withUserDefaults: mockUserDefaults)
    }
    
    func testEmptyUserToken() {
        XCTAssertEqual(getUserToken(), "")
    }
    
    func testNonEmptyUserToken() {
        addTestUserToken()
        XCTAssertEqual(getUserToken(), "TestUserToken")
    }
    
    func testCheckUserDefaultForToken() {
        addTestUserToken()
        getUserToken()
        XCTAssertTrue(mockUserDefaults.wasObjectForKeyCalled)
    }
    
    func testAddUserTokenAddsToUserDefaults() {
        userToken.addUserToken("TestUserToken")
        XCTAssertTrue(mockUserDefaults.wasSetObjectCalled)
    }
    
    private func addTestUserToken() {
        mockUserDefaults.setObject("TestUserToken", forKey: "UPCalories_userToken")
    }
    
    private func getUserToken() -> String {
        return userToken.getUserToken()
    }
}
