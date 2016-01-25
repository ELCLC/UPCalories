//
//  MockPlatform.swift
//  UPCalories
//
//  Created by Emma Lee-Choon on 24/01/2016.
//  Copyright © 2016 Emma Lee-Choon. All rights reserved.
//

import UIKit
import UPPlatformSDK

class MockPlatform: UPPlatform {
    var didCallStartSession: Bool = false
    var session: UPSession? = nil
    var error: NSError? = nil
    
    init(session: UPSession?, error: NSError?) {
        super.init()
        self.error = error
        self.session = session
    }
    
    override func startSessionWithClientID(clientID: String!, clientSecret: String!, authScope: UPPlatformAuthScope, redirectURI: String!, completion: UPPlatformSessionCompletion!) {
        didCallStartSession = true
        completion(session, error)
    }
}
