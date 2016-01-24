//
//  MockNSUserDefaults.swift
//  UPCalories
//
//  Created by Emma Lee-Choon on 24/01/2016.
//  Copyright © 2016 Emma Lee-Choon. All rights reserved.
//

import UIKit

class MockNSUserDefaults: NSUserDefaults {
    private var userToken: AnyObject? = nil
    var wasCalled: Bool = false
    
    override func setObject(value: AnyObject?, forKey defaultName: String) {
        if defaultName == "UPCalories_userToken" {
            userToken = value
        }
    }
    
    override func objectForKey(defaultName: String) -> AnyObject? {
        wasCalled = true
        if defaultName == "UPCalories_userToken" {
            return userToken
        }
        return nil
    }
}
