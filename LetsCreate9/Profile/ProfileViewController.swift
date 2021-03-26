//
//  ProfileViewController.swift
//  LetsCreate9
//
//  Created by Sheena Alston on 3/25/21.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    @IBOutlet weak var creatorType: UILabel!
    @IBOutlet weak var zipCode: UILabel!
        @IBOutlet weak var uName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

     


    let defaults = UserDefaults.standard
    
       Service.getUserInfo(onSuccess: {
        
        self.uName.text = " \(defaults.string(forKey: "userNameKey")!)"
        self.zipCode.text = " \(defaults.string(forKey: "userZipcodeKey")!)"
        self.creatorType.text = " \(defaults.string(forKey: "userCreativeKey")!)"
        
    }) { (error) in
        self.present(Service.createAlertController(title: "Error", message: error!.localizedDescription), animated: true, completion: nil)
    }
}


}
