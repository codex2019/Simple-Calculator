//
//  LoginViewController.swift
//  JobSearch
//
//  Created by MacX on 5/3/21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
   
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signInPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
                if let e = error {
                    print(e)
                } else {
                    self.performSegue(withIdentifier: "goToHomepage", sender: self)
                    print("Sign in successfully")
                }
            }
        }
    }
    
}
