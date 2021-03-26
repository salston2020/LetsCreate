//
//  Service.swift
//  SocialNetwork
//
//  Created by LzCtrl on 9/30/19.
//  Copyright © 2019 M & P Construction, Inc. All rights reserved.
//

import UIKit
import Firebase

class Service {
    
    static func signUpUser(email: String, password: String, name: String, zipcode: String, creative: String, onSuccess: @escaping () -> Void, onError: @escaping (_ error: Error?) -> Void) {
        let auth = Auth.auth()
        
        auth.createUser(withEmail: email, password: password) { (authResult, error) in
            if error != nil {
                onError(error!)
                return
            }
            
            uploadToDatabase(email: email, name: name, zipcode: zipcode, creative: creative, onSuccess: onSuccess)
        }
    }
    
    static func uploadToDatabase(email: String, name: String, zipcode: String, creative: String, onSuccess: @escaping () -> Void) {
        let ref = Database.database().reference()
        let uid = Auth.auth().currentUser?.uid
        
        ref.child("users").child(uid!).setValue(["email" : email, "name" : name, "zipcode" : zipcode, "creative" : creative])
        onSuccess()
    }
    
    static func getUserInfo(onSuccess: @escaping () -> Void, onError: @escaping (_ error: Error?) -> Void) {
        let ref = Database.database().reference()
        let defaults = UserDefaults.standard
        
        guard let uid = Auth.auth().currentUser?.uid else {
            print("User not found")
            return
        }
        
        ref.child("users").child(uid).observe(.value, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String : Any] {
                let email = dictionary["email"] as! String
                let name = dictionary["name"] as! String
                let zipcode = dictionary["zipcode"] as! String
                let creative = dictionary["creative"] as! String
                
                defaults.set(email, forKey: "userEmailKey")
                defaults.set(name, forKey: "userNameKey")
                defaults.set(zipcode, forKey: "userZipcodeKey")
                defaults.set(creative, forKey: "userCreativeKey")
                
                onSuccess()
            }
        }) { (error) in
            onError(error)
        }
    }
    
    static func createAlertController(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        
        return alert
    }
    /// Chat Database
    class DatabaseManager {
         static let shared = DatabaseManager()

        private let database = Database.database().reference()

        public func test() {
            
            database.child("foo").setValue(["something": true])
        }
}
    
    /// Chat Database

            
            
}
    

