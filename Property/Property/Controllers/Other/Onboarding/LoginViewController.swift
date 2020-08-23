//
//  LoginViewController.swift
//  Property
//
//  Created by kobayashi emino on 2020/08/23.
//  Copyright © 2020 kobayashi emino. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let usernameEmailField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    private let passwordField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private let termsButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private let privacyButton: UIButton = {
        let button = UIButton()
        return button
    }()
    private let createAccountButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private let headerView: UIView = {
        let view = UIView()
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    private func addSubViews() {
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(createAccountButton)
        view.addSubview(headerView)
    }
    
    @objc private func didTapLoginButton() {}
    @objc private func didTapTerminalButton() {}
    @objc private func didTapPrivacyButton() {}
    @objc private func didTapCreateAccountButton() {}

}
