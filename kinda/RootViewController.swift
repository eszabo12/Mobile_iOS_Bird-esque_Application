//
//  RootViewController.swift
//  kinda
//
//  Created by Elle on 1/6/21.
//

import UIKit

class RootViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var userNameTextField: UITextField!
//    @IBOutlet weak var passwordTextField: UITextField!
//    @IBOutlet weak var signInButton: UIButton!
//    @IBOutlet weak var facebookButton: UIButton!
//    @IBOutlet weak var googleButton: UIButton!
//    @IBOutlet weak var appleButton: UIButton!
    
    @objc func didTapSignUpButton() {
        let signUpManager = FirebaseAuthManager()
        if let email = emailTextField.text, let password = passwordTextField.text {
            signUpManager.createUser(email: email, password: password) {[weak self] (success) in
                guard let `self` = self else { return }
                var message: String = ""
                if (success) {
                    message = "User was sucessfully created."
                } else {
                    message = "There was an error."
                }
                let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.display(alertController: alertController)
            }
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        let margins = view.layoutMarginsGuide
        userNameTextField.heightAnchor.constraint(equalToConstant: 20).isActive = true
        userNameTextField.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 10.0).isActive = true
        userNameTextField.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: -10.0).isActive = true
        
//        signInButton.isEnabled = false
        userNameTextField.placeholderText = "Username"
//        passwordTextField.placeholderText = "Password"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (userNameTextField.text!.count > 0 && passwordTextField.text!.count > 0){
            button.signInButton = true
        }
    }

}
}
