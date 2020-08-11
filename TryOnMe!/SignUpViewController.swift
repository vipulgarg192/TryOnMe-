//
//  SignUpViewController.swift
//  TryOnMe!
//
//  Created by vipul garg on 2020-08-07.
//  Copyright © 2020 VipulGarg. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var txtPasswordAgain: UITextField!
    
    // reference to the firebase database
        let ref = Database.database().reference()
        
        // to handle firebase exceptions
        
        var handle: AuthStateDidChangeListenerHandle?
        
        // getting user defaults reference
        //let userDefault = UserDefaults.standard
        
        // var to store check validation
        
        var firstNameValid = false
        var lastNameValid = false
        var emailValid = false
        var passwordValid = false
        var passwordAgainValid = false
        
    // to store the current active textfield
    var activeTextField : UITextField? = nil
        
        override func viewDidLoad() {
            super.viewDidLoad()
            //hiding keyboard when tapped on view
                 let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SignUpViewController.viewTapped(gestureRecognizer:)))
                        
                        view.addGestureRecognizer(tapGesture)
            
            // add delegate to all textfields to self (this view controller)
            txtFirstName.delegate = self
            txtLastName.delegate = self
            txtEmail.delegate = self
            txtPassword.delegate = self
            txtPasswordAgain.delegate = self
            //adjusting as per keyboard
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);

            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
                 
                 // Do any additional setup after loading the view.
             }
             
        //func to check if tapped on view
        
        @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer)
        {
            view.endEditing(true)
        }
    //keyboard hide and show funcs
        @objc func keyboardWillShow(sender: NSNotification) {

            var shouldMoveViewUp = false
            let info = sender.userInfo!
            let keyboardFrame: CGRect = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue

            // if active text field is not nil
            if let activeTextField = activeTextField {

              let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.view).maxY;
              
              let topOfKeyboard = self.view.frame.height - keyboardFrame.size.height

              // if the bottom of Textfield is below the top of keyboard, move up
              if bottomOfTextField > topOfKeyboard {
                shouldMoveViewUp = true
              }
            }

            if(shouldMoveViewUp) {
              self.view.frame.origin.y = 0 - keyboardFrame.size.height
            }
            
             //self.view.frame.origin.y = -(keyboardFrame.size.height + 20)// Move view 150 points upward
        }

        @objc func keyboardWillHide(sender: NSNotification) {
             self.view.frame.origin.y = 0 // Move view to original position
        }
        
        
        //func to check valid First Name in input
        
        func checkFirstName(){
            if(txtFirstName.text == ""){
                let alert = UIAlertController(title: "Please enter a First Name", message: "", preferredStyle: UIAlertController.Style.actionSheet)
                let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                alert.addAction(actionOk)
                self.present(alert, animated: true, completion: nil)
            } else{
                if(!(txtFirstName.text?.isValidName())!){
                    let alert = UIAlertController(title: "Please enter correct First Name", message: "", preferredStyle: UIAlertController.Style.actionSheet)
                    let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                    alert.addAction(actionOk)
                    self.present(alert, animated: true, completion: nil)
                } else {
                    firstNameValid = true
                }
            }
        }
        
        //func to check valid Last Name in input
        
        func checkLastName(){
            if(txtLastName.text == ""){
                let alert = UIAlertController(title: "Please enter a Last Name", message: "", preferredStyle: UIAlertController.Style.actionSheet)
                let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                alert.addAction(actionOk)
                self.present(alert, animated: true, completion: nil)
            } else{
                if(!(txtLastName.text?.isValidName())!){
                    let alert = UIAlertController(title: "Please enter correct Last Name", message: "", preferredStyle: UIAlertController.Style.actionSheet)
                    let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                    alert.addAction(actionOk)
                    self.present(alert, animated: true, completion: nil)
                } else {
                    lastNameValid = true
                }
            }
        }
        
        
        //func to check valid email in input
        
        func checkEmail(){
            if(txtEmail.text == ""){
                let alert = UIAlertController(title: "Please enter Email", message: "", preferredStyle: UIAlertController.Style.actionSheet)
                let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                alert.addAction(actionOk)
                self.present(alert, animated: true, completion: nil)
            } else{
                if(!(txtEmail.text?.isValidEmail())!){
                    let alert = UIAlertController(title: "Please enter correct Email", message: "", preferredStyle: UIAlertController.Style.actionSheet)
                    let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                    alert.addAction(actionOk)
                    self.present(alert, animated: true, completion: nil)
                } else {
                    emailValid = true
                }
            }
        }
        
        //func to check valid password in input
        
        func checkPassword(){
            if(txtPassword.text == ""){
                let alert = UIAlertController(title: "Please enter Password", message: "", preferredStyle: UIAlertController.Style.actionSheet)
                let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                alert.addAction(actionOk)
                self.present(alert, animated: true, completion: nil)
            } else{
                if(!(txtPassword.text?.isValidPassword())!){
                    let alert = UIAlertController(title: "Password should be 8 character long with uppercase, lower case, number and a special character", message: "", preferredStyle: UIAlertController.Style.actionSheet)
                    let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                    alert.addAction(actionOk)
                    self.present(alert, animated: true, completion: nil)
                } else {
                    passwordValid = true
                }
            }
        }
        
        //func to check password matches in input
        
        func checkPasswordAgain(){
            if(txtPasswordAgain.text == ""){
                let alert = UIAlertController(title: "Please enter Password Again", message: "", preferredStyle: UIAlertController.Style.actionSheet)
                let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                alert.addAction(actionOk)
                self.present(alert, animated: true, completion: nil)
            } else{
                if(txtPassword.text != txtPasswordAgain.text){
                    let alert = UIAlertController(title: "Password does not match", message: "", preferredStyle: UIAlertController.Style.actionSheet)
                    let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                    alert.addAction(actionOk)
                    self.present(alert, animated: true, completion: nil)
                } else {
                    passwordAgainValid = true
                }
            }
        }
        
        //check all
        
        func checkAll(){
            self.checkFirstName()
            self.checkLastName()
            self.checkEmail()
            self.checkPassword()
            self.checkPasswordAgain()
        }
        
        
        @IBAction func signUpCheck(_ sender: UIButton) {
            
            //checking everything is right before signing in
            
            self.checkAll()
            
            if (firstNameValid && lastNameValid && emailValid && passwordValid && passwordAgainValid){
                
                print(firstNameValid)
                print(lastNameValid)
                print(emailValid)
                print(passwordValid)
                print(passwordAgainValid)
                
            //changed email to lower case to make email consistent
            
            let lowerCasedEmail = txtEmail.text!.lowercased()
            
            Auth.auth().createUser(withEmail: lowerCasedEmail, password: self.txtPasswordAgain.text!) { authResult, error in
                if error == nil{
                    print("data going in")
                    
                    //after creating user add all data to the firebase database
                    let user = Auth.auth().currentUser
                    if let user = user {
                        print("user created \(user.uid)")
                        self.ref.child("users").child(user.uid).setValue(["username": user.uid])
                        self.ref.child("users").child(user.uid).child("firstName").setValue(self.txtFirstName.text)
                        self.ref.child("users").child(user.uid).child("lastName").setValue(self.txtLastName.text)
                        self.ref.child("users").child(user.uid).child("email").setValue(user.email)
                       
                    }
                    
                    //showing alerts
                    
                    let alert = UIAlertController(title: "Hi, \(String(describing: self.txtFirstName.text!)) you are successfully signed up", message: "", preferredStyle: UIAlertController.Style.actionSheet)
                    let actionOk = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (actionOK) in
                        
                    })
                    alert.addAction(actionOk)
                    self.present(alert, animated: true, completion: nil)
                } else
                {
                    print("some error in data")
                    //self.handleError(error!)   // use the handleError method
                }
               

            }
        }
     // ... creating new user with email and password and can handle errors over here
//    extension AuthErrorCode {
//        var errorMessage: String {
//            switch self {
//            case .emailAlreadyInUse:
//                return "The email is already in use with another account"
//            case .userNotFound:
//                return "Account not found for the specified user. Please check and try again"
//            case .userDisabled:
//                return "Your account has been disabled. Please contact support."
//            case .invalidEmail, .invalidSender, .invalidRecipientEmail:
//                return "Please enter a valid email"
//            case .networkError:
//                return "Network error. Please try again."
//            case .weakPassword:
//                return "Your password is too weak. The password must be 6 characters long or more."
//            case .wrongPassword:
//                return "Your password is incorrect. Please try again or use 'Forgot password' to reset your password"
//            default:
//                return "Unknown error occurred"
//            }
//        }
//    }


//    extension UIViewController{
//        func handleError(_ error: Error) {
//            if let errorCode = AuthErrorCode(rawValue: error._code) {
//                print(errorCode.errorMessage)
//                let alert = UIAlertController(title: "Error", message: errorCode.errorMessage, preferredStyle: .alert)
//
//                let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
//
//                alert.addAction(okAction)
//
//                self.present(alert, animated: true, completion: nil)
//
//            }
//        }
//
//    }

    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
}

extension SignUpViewController {
  // when user select a textfield, this method will be called
  func textFieldDidBeginEditing(_ textField: UITextField) {
    // set the activeTextField to the selected textfield
    self.activeTextField = textField
  }
    
  // when user click 'done' or dismiss the keyboard
  func textFieldDidEndEditing(_ textField: UITextField) {
    self.activeTextField = nil
  }
}
