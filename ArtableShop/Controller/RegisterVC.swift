//
//  LoginVC.swift
//  ArtableShop
//
//  Created by Max Rimarchuk on 11.04.21.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var confirmPasswordTxt: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var passCheckImg: UIImageView!
    @IBOutlet weak var confirmPassCheckImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        confirmPasswordTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let passwordTxtText = passwordTxt.text else { return }
        guard let confirmPasswordTxtText = confirmPasswordTxt.text else { return }
        
        if passwordTxtText.isNotEmpty && confirmPasswordTxtText.isNotEmpty {
            passCheckImg.isHidden = false
            confirmPassCheckImg.isHidden = false
        } else {
            passCheckImg.isHidden = true
            confirmPassCheckImg.isHidden = true
        }
        
        if passwordTxt.text == confirmPasswordTxt.text {
            passCheckImg.image = UIImage(named: AppImages.GreenCheck)
            confirmPassCheckImg.image = UIImage(named: AppImages.GreenCheck)
        } else {
            passCheckImg.image = UIImage(named: AppImages.RedCheck)
            confirmPassCheckImg.image = UIImage(named: AppImages.RedCheck)
        }
    }
    
    @IBAction func registerBtnClicked(_ sender: Any) {
//        if (!usernameTxt.text?.isEmpty && !emailTxt.text?.isEmpty) {
        guard let username = self.usernameTxt.text, username.isNotEmpty,
              let email = self.emailTxt.text, email.isNotEmpty,
              let password = self.passwordTxt.text, password.isNotEmpty,
              let confirmPassword = self.confirmPasswordTxt.text, confirmPassword.isNotEmpty else { return }
        
        activityIndicator.startAnimating()
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            if let error = error {
                debugPrint(error)
                return
            }
            
            print("successfully registred new user")
            self.activityIndicator.stopAnimating()
        }
//        }
    }
    
}
