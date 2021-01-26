//
//  LoginViewController.swift
//  Diss2020
//
//  Created by Harris Aslam on 16/03/2020.
//  Copyright © 2020 Harris Aslam. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad() 

        // Do any additional setup after loading the view.
        
        setUpElements()
        self.hideKeyboardWhenTappedAround()
    }
    
    func setUpElements(){
        errorLabel.alpha = 0
        
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil{
                self.errorLabel.text = error?.localizedDescription
                self.errorLabel.alpha = 1
            }
            else {
                self.transitionToHome()
            }
        }
    }
    
    func transitionToHome()
       {
          let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.HomeViewController) as? HomeViewController
           
           view.window?.rootViewController = homeViewController
           view.window?.makeKeyAndVisible()
       }
}
