//
//  RegisVC.swift
//  FIBDemo
//
//  Created by Michael Lin on 10/3/20.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class RegisVC: UIViewController {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var firstNameTextField: AuthItemTextField!
    @IBOutlet weak var lastNameTextField: AuthItemTextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: AuthItemTextField!
    @IBOutlet weak var mobileLabel: UILabel!
    @IBOutlet weak var mobileTextField: AuthItemTextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var disclaimerLabel: UILabel!
    @IBOutlet weak var regisButton: UIButton!
    @IBOutlet weak var loginPromptLabel: UILabel!
    @IBOutlet weak var loginPromptButton: UIButton!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var dobTextField: AuthItemTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setup()
        hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    
    private func setup() {
        
        let promptColor = UIColor(hex: "#575757")
        let promptFont = UIFont.SFProDisplay(type: .bold, size: 13)
        
        headerLabel.textColor = UIColor.HOTVPrimary
        headerLabel.font = UIFont.SFProDisplay(type: .heavy, size: 30)
        headerLabel.text = "Register"
        
        noteLabel.textColor = UIColor.HOTVPrimary
        noteLabel.font = UIFont.SFProDisplay(type: .bold, size: 14)
        noteLabel.text = "Please enter your full name."
        
        firstNameLabel.textColor = promptColor
        firstNameLabel.font = promptFont
        firstNameLabel.text = "FIRST NAME:"
        lastNameLabel.textColor = promptColor
        lastNameLabel.font = promptFont
        lastNameLabel.text = "LAST NAME:"
        
        firstNameTextField.placeholder = "First Name"
        firstNameTextField.delegate = self
        
        lastNameTextField.placeholder = "Last Name"
        lastNameTextField.delegate = self
        
        dobLabel.font = promptFont
        dobLabel.textColor = promptColor
        dobLabel.text = "DATE OF BIRTH:"
        dobTextField.placeholder = "MM-DD-YYYY"
        dobTextField.delegate = self
        dobTextField.tag = 1
        dobTextField.keyboardType = .numberPad
        
        emailLabel.font = promptFont
        emailLabel.textColor = promptColor
        emailLabel.text = "EMAIL:"
        emailTextField.placeholder = "example@domain.com"
        emailTextField.delegate = self
        emailTextField.keyboardType = .emailAddress
        
        mobileLabel.font = promptFont
        mobileLabel.textColor = promptColor
        mobileLabel.text = "MOBILE:"
        mobileTextField.placeholder = "(123)-456-789"
        mobileTextField.delegate = self
        mobileTextField.keyboardType = .numberPad

        passwordLabel.font = promptFont
        passwordLabel.textColor = promptColor
        passwordLabel.text = "PASSWORD:"
        passwordTextField.placeholder = "********"
        passwordTextField.delegate = self
        
        regisButton.setTitle("Register", for: .normal)
        
        loginPromptLabel.text = "Already have an account?"
        loginPromptLabel.font = UIFont.SFProDisplay(type: .bold, size: 11)
        loginPromptLabel.textColor = UIColor(hex: "#BABABA")
        
        loginPromptButton.tintColor = UIColor.init(hex: "#ff5f52")
        loginPromptButton.titleLabel?.font = UIFont.SFProDisplay(type: .bold, size: 11)
        loginPromptButton.setTitle("Login Now", for: .normal)
        loginPromptButton.addTarget(self, action: #selector(didTapLogin(_:)), for: .touchUpInside)
        
    }
    
    @objc func didTapLogin(_ sender: Any?) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerTapped(_ sender: Any) {
        let error = validateFields()
        guard error == nil, let email = emailTextField.text, let password = passwordTextField.text, let dob = dobTextField.text, let mobile = mobileLabel.text, let firstname = firstNameTextField.text, let lastname = lastNameTextField.text else {
            self.noteLabel.text = error
            return
        }
        
        
    }
    
    func validateFields() -> String? {
        //check that all fields are filled in
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please make sure to enter email and password"
        }
        
        if firstNameLabel.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please enter your first name"
        }
        
        if lastNameLabel.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please enter your last name"
        }
        
        if mobileLabel.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please enter your phone number"
        }
        
        if dobTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please enter your birthday"
        }

        return nil
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RegisVC: UITextFieldDelegate {
    
}
