//
//  ForgotPassword.swift
//  LetsCreate9
//
//  Created by Sheena Alston on 3/24/21.
//

import UIKit
import Firebase

class ForgotPassword: UIViewController {
    
    @IBOutlet weak var forgetPassword: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        let auth = Auth.auth()
        
        auth.sendPasswordReset(withEmail: emailField.text!) { (error) in
            if let error = error {
                let alert = Service.createAlertController(title: "Error", message: error.localizedDescription)
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            let alert = Service.createAlertController(title: "Hurray", message: "A password reset email has been sent!")
            self.present(alert, animated: true, completion: nil)
        }
    }

}
   
