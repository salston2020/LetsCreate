//
//  SignInViewController.swift
//  LetsCreate9
//
//  Created by Sheena Alston on 3/24/21.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginButtonPressed(_ sender: Any) {
        let auth = Auth.auth()
        let defaults = UserDefaults.standard
        
        auth.signIn(withEmail: emailField.text!, password: passwordField.text!) { (authResult, error) in
            if error != nil {
                self.present(Service.createAlertController(title: "Error", message: error!.localizedDescription), animated: true, completion: nil)
                return
            }
            
            defaults.set(true, forKey: "isUserSignedIn")
            self.performSegue(withIdentifier: "userSignedInSegue", sender: nil)
        }
        
    }
    
    @IBAction func forgotPassButton_Tapped(_ sender: Any) {
        self.performSegue(withIdentifier: "forgotPassSegue", sender: nil)
    }
}


