//
//  RootViewController.swift
//  kinda
//
//  Created by Elle on 1/6/21.
//

import UIKit

class RootViewController: UIViewController, UITextFieldDelegate {
    public var userNameTextField: UITextField!
    var logo: UIImageView!
    public var passwordTextField: UITextField!
    public var signInButton: UIButton!
//    @IBOutlet weak var facebookButton: UIButton!
//    @IBOutlet weak var googleButton: UIButton!
//    @IBOutlet weak var appleButton: UIButton!
    
    
    @objc func didTapSignUpButton() {
        print("SADKFJASLKDJFLKS;DAFKLASDJFKLASDJFKLA;SJFLSADKL;FJK")
        let signUpManager = FirebaseAuthManager()
        if let email = userNameTextField.text, let password = passwordTextField.text {
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
//                self.present(alertController, animated: true)
                if (!success){
                    let viewController = MapViewController()
                    viewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                    self.present(viewController, animated: false)
                }
            }
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.systemBlue.cgColor, UIColor.systemPurple.cgColor]
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 0.75, y: 0.75)
        view.layer.insertSublayer(gradient, at: 0)
        logo = UIImageView(image: UIImage(named: "logo"))
        logo.frame = CGRect(x: view.bounds.width/2.0 - 170, y: 60, width: 350, height: 350)
        view.addSubview(logo)
        userNameTextField = UITextField()
        userNameTextField.frame = CGRect(x: 10, y: logo.frame.maxY, width: view.bounds.width - 20, height: 40)
        
        userNameTextField.backgroundColor = UIColor.black
        userNameTextField.textColor = UIColor.white
        userNameTextField.attributedPlaceholder = NSAttributedString(string: "username / email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
//        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: userNameTextField.frame.height))
//        userNameTextField.leftView = paddingView
//        userNameTextField.leftViewMode = UITextField.ViewMode.always
        view.addSubview(userNameTextField)
        
        
        passwordTextField = UITextField()
        passwordTextField.isSecureTextEntry = true
        passwordTextField.frame = CGRect(x: userNameTextField.frame.minX, y: userNameTextField.frame.maxY + 10, width: userNameTextField.frame.width, height: userNameTextField.frame.height)
        
        passwordTextField.backgroundColor = UIColor.black
        passwordTextField.textColor = UIColor.white
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
//        passwordTextField.leftView = paddingView
//        passwordTextField.leftViewMode = UITextField.ViewMode.always
        view.addSubview(passwordTextField)
        signInButton = UIButton(frame: CGRect(x:view.center.x - 40, y: passwordTextField.frame.maxY + 30, width: 80, height: 45))
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.setTitleColor(UIColor.white, for: .normal)
        // light gray color
        signInButton.backgroundColor = UIColor(red: 0.76, green: 0.76, blue: 0.76, alpha: 1.00)
        signInButton.layer.cornerRadius = 5
        signInButton.isEnabled = true
        signInButton.setBackgroundColor(color: UIColor(red: 0.86, green: 0.86, blue: 0.86, alpha: 1.00), forState: UIControl.State.highlighted)
        signInButton.addTarget(self,
                         action: #selector(signInButtonAction),
                         for: .touchUpInside)
        view.addSubview(signInButton)
        
        let divider = UIView(frame: CGRect(x: 5, y: signInButton.frame.maxY + 20, width: view.bounds.width - 10, height: 1))
        divider.backgroundColor = UIColor(red: 0.86, green: 0.86, blue: 0.86, alpha: 1.00)
        view.addSubview(divider)
        

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @objc
    func signInButtonAction() {
        print("Button pressed")
        didTapSignUpButton()
    }

}
