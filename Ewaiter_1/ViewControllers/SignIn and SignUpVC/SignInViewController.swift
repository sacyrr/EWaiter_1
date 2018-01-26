//
//  SignInViewController.swift
//  Ewaiter_1
//
//  Created by sachin on 22/01/18.
//  Copyright © 2018 sachin. All rights reserved.
//

import UIKit
import GoogleSignIn
class SignInViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print(user.profile.email)
    }
    
    @IBOutlet weak var editEmail: UITextField!
    @IBOutlet weak var editPassword: UITextField!
    @IBOutlet weak var switchStatus: UISwitch!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
       /* let signInButton = GIDSignInButton(frame: CGRect(x: 221, y: 38, width: 100, height: 50))
        signInButton.center = view.center
        view.addSubview(signInButton)
*/
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignInPressed(_ sender: Any) {
        
        if switchStatus.isOn == true {
            // dictionary
            
            // PreferenceManger.getDefaultSharedPreferences(this)
            let userDefaults = UserDefaults.standard
            
            // putBoolean()
            userDefaults.setValue(true, forKey: "LoginStatus")
            
            // commit
            userDefaults.synchronize()
        }
        
        if(editEmail.text!.isEmpty && editPassword.text!.isEmpty){
            
            let alert = UIAlertController(title: "confirmation", message: "Email and password Are Mandatory", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: {(action) in
                
            }))
            self.present(alert, animated: true, completion: nil)
            
            
        }else{
            
            let email:String = editEmail.text!
            let password:String = editPassword.text!
            getUser(email: email,password: password)
        }
        
        
    }
    
    func getUser(email:String,password:String) {
        // http://localhost:5000/contact
        let strUrl = baseUrl + routeContact + "?Email=\(email)&Password=\(password)"
        let url = URL(string: strUrl)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(
            with: url!,
            completionHandler: {(data, response, error) in
                let json = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                print(json)
                let status = json as! [String:Any]
                let loginStatus = status["status"] as? String
                
                if loginStatus=="success"{
                    OperationQueue.main.addOperation { //has to call this on main thread
                        let vc:HamburgerMenuViewController   = Utils.createViewController(id: "HamburgerMenuViewController") as! HamburgerMenuViewController
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                }else{
                    let alert = UIAlertController(title: "error", message: "password or username does not match", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(
                        title: "ok",
                        style: .default,
                        handler: { (action) in
                            alert.dismiss(animated: true, completion: nil)
                    }))
                    OperationQueue.main.addOperation {
                        self.present(alert, animated: true, completion: nil)
                    }
                }
        })
        task.resume()
    
        
    }
   
    @IBAction func onSignUpPressed(_ sender: Any) {
        
        let vc :SignUpViewController = Utils.createViewController(id: "SignUpViewController") as! SignUpViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
