//
//  RootViewController.swift
//  kinda
//
//  Created by Elle on 1/6/21.
//

import UIKit

class RootViewController: UIViewController, UITextFieldDelegate {
    var userNameTextField: UITextField!
//    @IBOutlet weak var passwordTextField: UITextField!
//    @IBOutlet weak var signInButton: UIButton!
//    @IBOutlet weak var facebookButton: UIButton!
//    @IBOutlet weak var googleButton: UIButton!
//    @IBOutlet weak var appleButton: UIButton!
    
//    @objc func didTapSignUpButton() {
//        let signUpManager = FirebaseAuthManager()
//        if let email = emailTextField.text, let password = passwordTextField.text {
//            signUpManager.createUser(email: email, password: password) {[weak self] (success) in
//                guard let `self` = self else { return }
//                var message: String = ""
//                if (success) {
//                    message = "User was sucessfully created."
//                } else {
//                    message = "There was an error."
//                }
//                let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
//                alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//                self.display(alertController: alertController)
//            }
//        }


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        let margins = view.layoutMarginsGuide
        userNameTextField = UITextField()
        self.view.addSubview(userNameTextField)
        let constraints = [
//            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
//            view.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
//            view.widthAnchor.constraint(equalToConstant: 100),
//            view.heightAnchor.constraint(equalTo: view.widthAnchor)
            userNameTextField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            userNameTextField.heightAnchor.constraint(equalToConstant: 20),
            userNameTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 10),
            userNameTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: -10),
        ]
        NSLayoutConstraint.activate(constraints)
//
//        signInButton.isEnabled = false
        self.userNameTextField.placeholder = "Username"
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
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        if (userNameTextField.text!.count > 0 && passwordTextField.text!.count > 0){
//            signInButton.enabled = true
//        }
//    }

}
