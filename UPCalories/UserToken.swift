//
//  UserToken.swift
//  UPCalories
//
//  Created by Emma Lee-Choon on 24/01/2016.
//  Copyright © 2016 Emma Lee-Choon. All rights reserved.
//

import UIKit

class UserToken: NSObject {
    var userDefaults: NSUserDefaults? = nil
    
    init(defaults: NSUserDefaults) {
        userDefaults = defaults
    }
    
    func getUserToken() -> String {
        let userToken: String? = userDefaults!.objectForKey("UPCalories_userToken") as? String
        if let token = userToken {
            return token
        }
        return ""
    }
}
