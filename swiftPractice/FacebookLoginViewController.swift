//
//  FacebookLoginViewController.swift
//  swiftPractice
//
//  Created by 김현우 on 2015. 12. 22..
//  Copyright © 2015년 박윤종. All rights reserved.
//

import UIKit

class FacebookLoginViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let loginButton = FBSDKLoginButton.init()
        loginButton.center = self.view.center
        self.view.addSubview(loginButton)
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        loginButton.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print ("User Logged In")
        if ((error) != nil) {
            
        }
        else if (result.isCancelled) {
            
        }
        else {
            if (result.grantedPermissions.contains("email")) {
                self.returnUserData()
            }
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print ("User Logged Out")
    }

    
    func returnUserData() {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields" : "email, name"])
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            if ((error) != nil) {
                print ("Error: \(error)")
            }
            else {
                print ("fetched user: \(result)")
                let userName : NSString = result.valueForKey("name") as! NSString
                var userEmail = ""
                if let tmpString = result.valueForKey("email") as! String? {
                    userEmail = tmpString
                }
                print ("User Name is : \(userName)")
                print ("User Email is : \(userEmail)")
            }
        })
    }
}
