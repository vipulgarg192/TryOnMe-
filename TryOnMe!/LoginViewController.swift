//
//  LoginViewController.swift
//  TryOnMe!
//
//  Created by vipul garg on 2020-08-07.
//  Copyright © 2020 VipulGarg. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnLogin(_ sender: UIButton) {
        let lowerCasedEmail = txtEmail.text!.lowercased()
                
                Auth.auth().signIn(withEmail: lowerCasedEmail, password: self.txtPassword.text!) { [weak self] user, error in
                    //guard let strongSelf = self else { return }
                    // ...
                    if error == nil{
                        
                        //here we are not implementing user defaults to remember details
                        
//                        let userDefault = UserDefaults.standard
//                        if self!.switchRememberMe.isOn
//                        {
//
//                            userDefault.setValue(self!.txtEmail.text, forKey: "userEmail")
//                            userDefault.set(self!.txtPassword.text, forKey: "userPassword")
//                        }
//                        else
//                        {
//                            userDefault.removeObject(forKey: "userEmail")
//                            userDefault.removeObject(forKey: "userPassword")
//                        }
                        
                        if (self?.txtEmail.text == "admin@routes.com") // check if admin email
                        {
                            //perform segue on condition
                           // self?.performSegue(withIdentifier: "adminHomeS", sender: nil)
                            
                        } else{
                            //perform segue on condition
                            self?.performSegue(withIdentifier: "LoginS", sender: nil)
                            
                        }
                        } else {
                        let alert = UIAlertController(title: "Invalid Credentials", message: "", preferredStyle: UIAlertController.Style.actionSheet)
                        let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                        alert.addAction(actionOk)
                        self!.present(alert, animated: true, completion: nil)
                        }
                    
                }

                }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
