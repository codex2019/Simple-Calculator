//
//  RegisterViewController.swift
//  JobSearch
//
//  Created by MacX on 5/4/21.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
 
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
                    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                        if let e = error {
                            print(e)
                        } else {
                            self.performSegue(withIdentifier: "goToHomepage", sender: self)
                            print("Registered successfully")
                        }
                    }
                }
    }
}
