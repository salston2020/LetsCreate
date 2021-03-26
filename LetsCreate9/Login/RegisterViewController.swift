//
//  RegisterViewController.swift
//  LetsCreate9
//
//  Created by Sheena Alston on 3/24/21.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var zipcodeField: UITextField!
    
    @IBOutlet weak var ctype: UITextField!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

              
        profileImage.isUserInteractionEnabled = true
      

        let gesture = UITapGestureRecognizer(target: self,
                                             action: #selector(didTapChangeProfilePic))
        profileImage.addGestureRecognizer(gesture)
    }

    @objc private func didTapChangeProfilePic() {
        presentPhotoActionSheet()
    }
                
               
        
    
    @IBAction func signUpPressed(_ sender: Any) {
    
    let defaults = UserDefaults.standard
    
        Service.signUpUser(email: emailField.text!, password: passwordField.text!, name: nameField.text!, zipcode: zipcodeField.text!, creative: ctype.text!, onSuccess: {
        defaults.set(true, forKey: "isUserSignedIn")
            
        self.performSegue(withIdentifier: "userSignedUpSegue", sender: nil)
    }) { (error) in
        self.present(Service.createAlertController(title: "Error", message: error!.localizedDescription), animated: true, completion: nil)
    }
}
    func uploadImage(_ image:UIImage, completion: @escaping (_ url: URL?) -> ()){
        let imgTitle = self.nameField.text!
        let storageRef = Storage.storage().reference().child(imgTitle)
        let imgData = profileImage.image?.pngData()
        let metaData = StorageMetadata()
        metaData.contentType = "image/png"
        storageRef.putData(imgData!, metadata: metaData) { (metadata, error) in
            if error == nil {
                storageRef.downloadURL(completion: { (url, error) in
                    completion(url)
                })
                print("Success")
            } else{
                print("####################################################################")
                print("Error in save image")
                print("####################################################################")
                print(error.debugDescription as Any)
                completion(nil)
            }
}

    }
}

extension RegisterViewController:  UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    func presentPhotoActionSheet() {
        let actionSheet = UIAlertController(title: "Profile Picture",
                                            message: "How would you like to select a picture?",
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel",
                                            style: .cancel,
                                            handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Take Photo",
                                            style: .default,
                                            handler: { [weak self] _ in

                                                self?.presentCamera()

        }))
        actionSheet.addAction(UIAlertAction(title: "Chose Photo",
                                            style: .default,
                                            handler: { [weak self] _ in

                                                self?.presentPhotoPicker()

        }))

        present(actionSheet, animated: true)
    }

    func presentCamera() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }

    func presentPhotoPicker() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }

        self.profileImage.image = selectedImage
        profileImage.contentMode = .scaleAspectFill
        profileImage.sizeToFit()
  
        profileImage.layer.cornerRadius = 2
        profileImage.clipsToBounds = true    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

}
