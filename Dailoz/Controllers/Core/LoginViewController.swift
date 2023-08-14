//
//  LoginViewController.swift
//  Dailoz
//
//  Created by mike on 14/08/2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    var titleLbl = UILabel()
    var userNameTF = CustomTextField()
    var passwordTF = CustomTextField()
    var forgotPasswordBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        passwordTF.tfInput.isSecureTextEntry = true
        handleBtnTap()
        setupView()
    }
    
    private func handleBtnTap() {
        passwordTF.hideTextIcon.addTarget(self, action: #selector(revealPassword), for: .touchUpInside)
        forgotPasswordBtn.addTarget(self, action: #selector(forgotPasswordBtnTap), for: .touchUpInside)
    }
    
    private func setupView() {
        let subViews = [titleLbl, userNameTF, passwordTF, forgotPasswordBtn]
        for subView in subViews {
            
            // important for autolayout
            subView.translatesAutoresizingMaskIntoConstraints = false
            // add view to the superview
            view.addSubview(subView)
            
        }
        setupTitle()
        setupUserNameTF()
        setupPasswordTF()
        setupForgotBtn()
    }
    
    @objc private func forgotPasswordBtnTap() {
        print("Lay lai mat khau")
    }
    
    @objc private func revealPassword() {
        passwordTF.tfInput.isSecureTextEntry.toggle()
    }
    
    private func setupTitle() {
        titleLbl.text = "Login"
        titleLbl.font = UIFont(name: "Roboto-Bold", size: 36)
        titleLbl.textColor = UIColor(named: "primary_purple")
        
        NSLayoutConstraint.activate([
            titleLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            titleLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ])
    }
    
    private func setupUserNameTF() {
        userNameTF.setupTextFields(placeholder: "Email ID or Username", image: "Message")
        userNameTF.hideTextIcon.isHidden = true
        NSLayoutConstraint.activate([
            userNameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            userNameTF.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 88),
            userNameTF.containerView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func setupPasswordTF() {
        passwordTF.setupTextFields(placeholder: "Password", image: "Lock")
        NSLayoutConstraint.activate([
            passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            passwordTF.topAnchor.constraint(equalTo: userNameTF.bottomAnchor, constant: 24),
            passwordTF.containerView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func setupForgotBtn() {
        forgotPasswordBtn.backgroundColor = .clear
        forgotPasswordBtn.setTitle("Forgot Password ?", for: .normal)
        forgotPasswordBtn.setTitleColor(UIColor(named: "primary_purple"), for: .normal)
        forgotPasswordBtn.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 14)
        
        NSLayoutConstraint.activate([
            forgotPasswordBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            forgotPasswordBtn.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 16)
        ])
    }
    
}
