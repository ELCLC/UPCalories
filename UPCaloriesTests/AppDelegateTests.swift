//
//  AppDelegateTests.swift
//  UPCalories
//
//  Created by Emma Lee-Choon on 25/01/2016.
//  Copyright © 2016 Emma Lee-Choon. All rights reserved.
//

import XCTest
@testable import UPCalories

class AppDelegateTests: XCTestCase {
    
    func testApplicationDidFinishLaunchingWithOptionsReturnsTrue() {
        let appDelegate = AppDelegate()
        XCTAssertTrue(appDelegate.application(UIApplication.sharedApplication(), didFinishLaunchingWithOptions: nil))
    }

}
