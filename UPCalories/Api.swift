//
//  Api.swift
//  UPCalories
//
//  Created by Emma Lee-Choon on 24/01/2016.
//  Copyright © 2016 Emma Lee-Choon. All rights reserved.
//

import UIKit
import UPPlatformSDK

protocol ApiProtocol {
    func startSessionWith(completion:((session: UPSession!, error: NSError!) -> ())?)
}

class Api: ApiProtocol {
    var platform: UPPlatform!
    
    init(withPlatform platform: UPPlatform) {
        self.platform = platform
    }
    
    func startSessionWith(completion:((session: UPSession!, error: NSError!) -> ())?) {
        platform.startSessionWithClientID("LSHE8CpSeTk", clientSecret: "b0bc91f41499cc717ee613fe6e7e1fe4c5d9d871", authScope: UPPlatformAuthScope.All, redirectURI: "up-platform://redirect") { (upSession: UPSession!, error: NSError!) -> Void in
            if let completion = completion {
                completion(session: upSession, error: error)
            }
        }
    }
}
