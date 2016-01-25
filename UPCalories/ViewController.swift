//
//  ViewController.swift
//  UPCalories
//
//  Created by Emma Lee-Choon on 24/01/2016.
//  Copyright © 2016 Emma Lee-Choon. All rights reserved.
//

import UIKit
import UPPlatformSDK

class ViewController: UIViewController {
    
    var api: Api?
    var userToken: UserToken?

    override func viewDidAppear(animated: Bool) {
        
        if let api = self.api {
            api.startSessionWith { (session, error) -> () in
                if error == nil {
                    if let userToken = self.userToken {
                        userToken.addUserToken(session.authenticationToken)
                    }
                }
            }
        }
    }
}

