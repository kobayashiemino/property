//
//  LoginViewController.swift
//  Property
//
//  Created by kobayashi emino on 2020/08/23.
//  Copyright © 2020 kobayashi emino. All rights reserved.
//

import UIKit
import SafariServices

class LoginViewController: UIViewController {
    
    struct Constants {
        static let cornerRadious: CGFloat = 8.0
    }
    
    private let usernameEmailField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "username or email..."
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
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        // ???
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadious
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let termsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Terms of Serviced", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let privacyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    private let createAccountButton: UIButton = {
        let button = UIButton()
        // ???
        button.setTitleColor(.label, for: .normal)
        button.setTitle("New User? Create an Account", for: .normal)
        return button
    }()
    
    private let headerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        let backgroundImageView = UIImageView(image: UIImage(named: "background"))
        view.addSubview(backgroundImageView)
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameEmailField.delegate = self
        passwordField.delegate = self
        
        addSubViews()
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        headerView.frame = CGRect(x: 0,
                                  y: 0.0,
                                  width: view.width,
                                  height: view.height / 3.0)
        usernameEmailField.frame = CGRect(x: 25,
                                          y: headerView.bottom + 10,
                                          width: view.width - 50,
                                          height: 52)
        passwordField.frame = CGRect(x: 25,
                                     y: usernameEmailField.bottom + 10,
                                     width: view.width - 50,
                                     height: 52)
        loginButton.frame = CGRect(x: 25,
                                   y: passwordField.bottom + 10,
                                   width: view.width - 50,
                                   height: 52)
        createAccountButton.frame = CGRect(x: 25,
                                           y: loginButton.bottom + 10,
                                           width: view.width - 50,
                                           height: 52)
        termsButton.frame = CGRect(x: 25,
                                   y: view.height - view.safeAreaInsets.bottom - 100,
                                   width: view.width - 50,
                                   height: 52)
        privacyButton.frame = CGRect(x: 25,
                                     y: view.height - view.safeAreaInsets.bottom - 50,
                                     width: view.width - 50,
                                     height: 52)
        configureHeaderView()
        
    }
    
    private func configureHeaderView() {
        guard headerView.subviews.count == 1 else { return }
        guard let backgroundView = headerView.subviews.first else { return }
        backgroundView.frame = headerView.bounds
        
        let imageView = UIImageView(image: UIImage(named: "text"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width/4.0,
                                 y: view.safeAreaInsets.top,
                                 width: headerView.width/2,
                                 height: headerView.height - view.safeAreaInsets.top)
    }
    
    private func addSubViews() {
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(createAccountButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(headerView)
        
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        termsButton.addTarget(self, action: #selector(didTapTerminalButton), for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(didTapPrivacyButton), for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(didTapCreateAccountButton), for: .touchUpInside)
    }
    
    @objc private func didTapLoginButton() {
        usernameEmailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let usernameEmail = usernameEmailField.text, !usernameEmail.isEmpty, let password = passwordField.text, !password.isEmpty, password.count >= 8 else { return }
        
        var email: String?
        var username: String?
        
        if usernameEmail.contains("@"), usernameEmail.contains(".") {
            email = usernameEmail
        } else {
            username = usernameEmail
        }
        
        AuthManeger.shared.loginUser(username: username, email: email, password: password) { (success) in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
            else {
                let alert = UIAlertController(title: "Log In Error",
                                              message: "We were unnable to log you in.",
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss",
                                              style: .cancel,
                                              handler: nil))
                self.present(alert, animated: true)
            }
        }
    }
    @objc private func didTapTerminalButton() {
        guard let url = URL(string: "https://help.instagram.com/581066165581870") else { return }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    @objc private func didTapPrivacyButton() {
        guard let url = URL(string: "https://help.instagram.com/196883487377501?ref=dp)") else { return }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    @objc private func didTapCreateAccountButton() {
        let vc = RegisterViewController()
        vc.title = "Create Account"
        present(UINavigationController(rootViewController: vc), animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameEmailField {
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField {
            didTapLoginButton()
        }
        return true
    }
}
