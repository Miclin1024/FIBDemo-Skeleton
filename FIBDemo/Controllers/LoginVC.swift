//
//  LoginVC.swift
//  FIBDemo
//
//  Created by Michael Lin on 10/3/20.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: AuthItemTextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: AuthItemTextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var loginButton: HOTVButton!
    @IBOutlet weak var regisPromptLabel: UILabel!
    @IBOutlet weak var regisButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        hideKeyboardWhenTappedAround()
        setup()
        // Do any additional setup after loading the view.
    }
    
    private func setup() {
        
        headerLabel.textColor = UIColor.HOTVPrimary
        headerLabel.font = UIFont.SFProDisplay(type: .heavy, size: 30)
        headerLabel.text = "Login"
        
        emailLabel.textColor = UIColor(hex: "#575757")
        emailLabel.font = UIFont.SFProDisplay(type: .bold, size: 13)
        emailLabel.text = "YOUR EMAIL:"
        
        emailTextField.placeholder = "example@domain.com"
        emailTextField.delegate = self
        emailTextField.keyboardType = .emailAddress
        
        passwordLabel.textColor = UIColor(hex: "#575757")
        passwordLabel.font = UIFont.SFProDisplay(type: .bold, size: 13)
        passwordLabel.text = "PASSWORD"
        
        passwordTextField.placeholder = "*********"
        passwordTextField.delegate = self
        // Secure Text Field: Subclass UITextField
        
        errorMessageLabel.textColor = UIColor.init(hex: "#ff5f52")
        errorMessageLabel.font = UIFont.SFCompactRounded(type: .semibold, size: 13)
        errorMessageLabel.text = ""
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(didTapLoginWithEmail(_:)), for: .touchUpInside)
        
        regisPromptLabel.font = UIFont.SFProDisplay(type: .bold, size: 11)
        regisPromptLabel.text = "Don't have an account?"
        regisPromptLabel.textColor = UIColor(hex: "#BABABA")
        
        regisButton.tintColor = UIColor.init(hex: "#ff5f52")
        regisButton.titleLabel?.font = UIFont.SFProDisplay(type: .bold, size: 11)
        regisButton.setTitle("Register Now", for: .normal)
    }
    
    @objc func didTapLoginWithEmail(_ sender: Any?) {
        guard let email = emailTextField.text, email != "" else {
            errorMessageLabel.text = "You must provide an email"
            return
        }
        
        guard let password = passwordTextField.text, password != "" else {
            errorMessageLabel.text = "You must provide a password"
            return
        }
    
    }
}

extension LoginVC: UITextFieldDelegate {
    
}
