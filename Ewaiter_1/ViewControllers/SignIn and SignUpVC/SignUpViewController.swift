//
//  SignUpViewController.swift
//  Ewaiter_1
//
//  Created by sachin on 22/01/18.
//  Copyright © 2018 sachin. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var alreadyRegistered: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     //   let tap = UITapGestureRecognizer(target: self , action: #selector(SignInViewController.tapFunction))
       // alreadyRegistered.isUserInteractionEnabled = true
        //alreadyRegistered.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func tapFunction(sender:UITapGestureRecognizer){
        print("tap working")
    }

    @IBAction func onSignInPressed(_ sender: Any) {
        let vc :SignUpViewController = Utils.createViewController(id: "SignInViewController") as! SignUpViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func OnSignUpPressed(_ sender: Any) {
        if(firstName.text!.isEmpty){
            let alert = UIAlertController(title: "confirmation", message: "First Name Are Mandatory", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: {(action) in
                
            }))
            self.present(alert, animated: true, completion: nil)
            
        }else if(lastName.text!.isEmpty){
            
            
            let alert = UIAlertController(title: "confirmation", message: "lastName Are Mandatory", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: {(action) in
                
            }))
            self.present(alert, animated: true, completion: nil)
            
        }else if(email.text!.isEmpty)
        {
            
            let alert = UIAlertController(title: "confirmation", message: "email are Mandatory", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: {(action) in
                
            }))
            self.present(alert, animated: true, completion: nil)
            
        }else if(password.text!.isEmpty)
            
        {
            
            let alert = UIAlertController(title: "confirmation", message: "Password is Mandatory", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: {(action) in
                
            }))
            self.present(alert, animated: true, completion: nil)
            
        }
        else if(confirmPassword.text!.isEmpty)
        {
            
            let alert = UIAlertController(title: "confirmation", message: "confirmPassword is Mandatory", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: {(action) in
                
            }))
            self.present(alert, animated: true, completion: nil)
        }
      
        else if self.password.text! == self.confirmPassword.text!
        {
            
            
            //   let strUrl = baseUrl + "signup"
            //  let url = URL(string: "http://192.168.43.191:8080/EventManagement/signup")
            
            var request = URLRequest(url: URL(string:"http://192.168.43.29:3000/registration")!)
            
            let User = [
                "Fname": "\(firstName.text!)" ,
                "LName": "\(lastName.text!)",
                "Email": "\(email.text!)",
                "Password":"\(password.text!)" ,
                
                ] as[String :Any]
            
            print(User)
            //            Alamofire
            //                .request(url!, method: .post, parameters: User, encoding: JSONEncoding.default)
            //                .responseJSON(completionHandler: { (response) in
            //                    print("done")
            //                })
            
            
            request.httpMethod = "POST"
            request.httpBody = try? JSONSerialization.data(withJSONObject: User, options: [])
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let session = URLSession.shared
            let task = session.dataTask(with: request,completionHandler: {
                data,response,error -> Void in
                print(response!)
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String,AnyObject>
                    print(json)
                }catch{
                    print(error)
                }
                
                
            })
            
            task.resume()
            
            let alert = UIAlertController(title: "confirmation", message: "Registration is Successfuly Done", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {(action) in
                
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.loadLoginViewController()
                
            }))
            alert.addAction(UIAlertAction(title: "No", style: .default, handler: {(action) in
                
            }))
            self.present(alert, animated: true, completion: nil)
            
            
            
        }
        else{
            
            
            let alert = UIAlertController(title: "confirmation", message: "PassWord and ConfirmPassword should be Same", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: {(action) in
                
            }))
            self.present(alert, animated: true, completion: nil)
            
            
            
        }
        
    }
    
}
