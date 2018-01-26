//
//  ViewController.swift
//  Ewaiter_1
//
//  Created by sachin on 27/01/18.
//  Copyright © 2018 sachin. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate{
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print(user.profile.email)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

      
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        let signInButton = GIDSignInButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        signInButton.center = view.center
        view.addSubview(signInButton)
    }

 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller usi
 // Implement these methods only if the GIDSignInUIDelegate is not a subclass of
 // UIViewController.
 
 // Stop the UIActivityIndicatorView animation that was started when the user
 // pressed the Sign In button
 */
  //  func signInWillDispatch(signIn: GIDSignIn!, error: Error!) {
// myActivityIndicator.stopAnimating()
// }
 
 // Present a view that prompts the user to sign in with Google
 func signIn(signIn: GIDSignIn!,
 presentViewController viewController: UIViewController!) {
    self.present(viewController, animated: true, completion: nil)
 }
 
 // Dismiss the "Sign in with Google" view
 func signIn(signIn: GIDSignIn!,
 dismissViewController viewController: UIViewController!) {
    self.dismiss(animated: true, completion: nil)
 }

}
