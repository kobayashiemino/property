//
//  RegisterViewController.swift
//  Property
//
//  Created by kobayashi emino on 2020/08/23.
//  Copyright © 2020 kobayashi emino. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    struct Constants {
        static let cornerRadious: CGFloat = 8.0
    }
    
    private let usernameField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "username..."
        textField.returnKeyType = .next
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.layer.cornerRadius = Constants.cornerRadious
        textField.backgroundColor = .secondarySystemBackground
        textField.layer.borderColor = UIColor.secondaryLabel.cgColor
        textField.layer.borderWidth = 1.0
        return textField
    }()
    
    private let emailField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "email account..."
        textField.returnKeyType = .next
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.layer.cornerRadius = Constants.cornerRadious
        textField.backgroundColor = .secondarySystemBackground
        textField.layer.borderColor = UIColor.secondaryLabel.cgColor
        textField.layer.borderWidth = 1.0
        return textField
    }()
    
    private let passwordField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "password..."
        textField.returnKeyType = .continue
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.layer.cornerRadius = Constants.cornerRadious
        textField.backgroundColor = .secondarySystemBackground
        textField.layer.borderColor = UIColor.secondaryLabel.cgColor
        textField.layer.borderWidth = 1.0
        return textField
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        // ???
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadious
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerButton.addTarget(self,
                                 action: #selector(didTapRegister),
                                 for: .touchUpInside)
        
        usernameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        
        addSubViews()
    }
    
    func addSubViews() {
        
        view.addSubview(usernameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(registerButton)
        
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        usernameField.frame = CGRect(x: 20,
                                     y: view.safeAreaInsets.top + 100,
                                     width: view.width - 40,
                                     height: 52)
        emailField.frame = CGRect(x: 20,
                                  y: usernameField.bottom + 10,
                                  width: view.width - 40,
                                  height: 52)
        passwordField.frame = CGRect(x: 20,
                                     y: emailField.bottom + 10,
                                     width: view.width - 40,
                                     height: 52)
        registerButton.frame = CGRect(x: 20,
                                      y: passwordField.bottom + 10,
                                      width: view.width - 40,
                                      height: 52)
    }
    
    @objc func didTapRegister() {
        usernameField.resignFirstResponder()
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let username = usernameField.text, !username.isEmpty, let email = emailField.text, !email.isEmpty, let password = passwordField.text, !password.isEmpty, password.count >= 8 else {
            return
        }
        
        DispatchQueue.main.async {
            AuthManeger.shared.registerNewUser(username: username, email: email, password: password) { (registerd) in
                if registerd {
                    
                }
                else {
                    
                }
            }
        }
    }
}

extension RegisterViewController: UITextFieldDelegate  {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField {
            emailField.becomeFirstResponder()
        }
        else if textField == emailField {
            passwordField.becomeFirstResponder()
        }
        else {
            didTapRegister()
        }
        return true
    }
}
