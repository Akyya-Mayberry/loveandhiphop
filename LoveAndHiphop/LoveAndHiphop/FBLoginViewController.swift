//
//  FBLoginViewController.swift
//  LoveAndHiphop
//
//  Created by Pari, Nithya on 4/30/17.
//  Copyright © 2017 Mogulla, Naveen. All rights reserved.
//

import UIKit
import FacebookLogin
import FBSDKLoginKit
import FBSDKCoreKit

class FBLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
        let loginButton = LoginButton(readPermissions: [ .publicProfile, .email, .userFriends ])

        loginButton.center = view.center
        
        view.addSubview(loginButton)
        
//        if let accessToken = AccessToken.current {
//            // User is logged in, use 'accessToken' here.
//            print("user is logged in!")
//            print(accessToken)
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
