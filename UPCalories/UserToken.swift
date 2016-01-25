//
//  UserToken.swift
//  UPCalories
//
//  Created by Emma Lee-Choon on 24/01/2016.
//  Copyright © 2016 Emma Lee-Choon. All rights reserved.
//

import UIKit

@objc
class UserToken: NSObject {
    let userTokenDefaultsKey = "UPCalories_userToken"
    var userDefaults: NSUserDefaults? = nil
    
    init(withUserDefaults defaults: NSUserDefaults) {
        userDefaults = defaults
    }
    
    func getUserToken() -> String {
        let userToken: String? = userDefaults!.objectForKey(userTokenDefaultsKey) as? String
        if let token = userToken {
            return token
        }
        return ""
    }
    
    func addUserToken(token: String) {
        userDefaults?.setObject(token, forKey: userTokenDefaultsKey)
    }
}
