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
    var loginBtn = UIButton()
    var horizontalView = UIStackView()
    var googleFBContainerView = UIStackView()
    var googleBtn = UIButton()
    var facebookBtn = UIButton()
    var signUpBtn = UIButton()
    
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
        googleBtn.addTarget(self, action: #selector(loginWithGoogleBtnTap), for: .touchUpInside)
        facebookBtn.addTarget(self, action: #selector(loginWithFacebookBtnTap), for: .touchUpInside)
        signUpBtn.addTarget(self, action: #selector(signUpBtnTap), for: .touchUpInside)
    }
    
    private func setupView() {
        let subViews = [titleLbl, userNameTF, passwordTF, forgotPasswordBtn, loginBtn, horizontalView, googleFBContainerView]
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
        setupLoginBtn()
        setupHorizontalLine()
        setupGoogleAndFacebookSection()
        setupAskSignUpSection()
    }
    
    @objc private func signUpBtnTap() {
        print("Chuyển hướng sang trang đăng ký")
    }
    
    @objc private func loginWithGoogleBtnTap() {
        print("Đăng nhập thành công với Google")
    }
    
    @objc private func loginWithFacebookBtnTap() {
        print("Đăng nhập thành công với Facebook")
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
        forgotPasswordBtn.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 12)
        
        NSLayoutConstraint.activate([
            forgotPasswordBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            forgotPasswordBtn.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 4)
        ])
    }
    
    private func setupLoginBtn() {
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.backgroundColor = UIColor(named: "primary_purple")
        loginBtn.layer.cornerRadius = 15
        loginBtn.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 16)
        NSLayoutConstraint.activate([
            loginBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginBtn.topAnchor.constraint(equalTo: forgotPasswordBtn.bottomAnchor, constant: 56),
            loginBtn.widthAnchor.constraint(equalToConstant: 300),
            loginBtn.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
    
    private func setupHorizontalLine() {
        let leftHorizontalLine = UIStackView()
        let rightHorizontalLine = UIStackView()
        let leftLine = UIView()
        let rightLine = UIView()
        let spacingView1 = UIView()
        let spacingView2 = UIView()
        let spacingView3 = UIView()
        let spacingView4 = UIView()
        let textLabel = UILabel()
        
        let mainStackView = [leftHorizontalLine, textLabel, rightHorizontalLine]
        let allViews = [leftHorizontalLine, textLabel, rightHorizontalLine, leftLine, rightLine, spacingView1, spacingView2, spacingView3, spacingView4]
        for view in allViews {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        for view in mainStackView {
            horizontalView.addArrangedSubview(view)
        }
        
        horizontalView.spacing = 10
        
        NSLayoutConstraint.activate([
            horizontalView.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 54),
            horizontalView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            horizontalView.widthAnchor.constraint(equalToConstant: 300),
            horizontalView.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        textLabel.text = "or with"
        textLabel.textAlignment = .center
        textLabel.font = UIFont(name: "Roboto-Medium", size: 12)
        textLabel.textColor = UIColor(named: "gray_E3E8F1")
        
        NSLayoutConstraint.activate([
            leftHorizontalLine.widthAnchor.constraint(equalToConstant: 120),
            rightHorizontalLine.widthAnchor.constraint(equalToConstant: 120)
        ])
        
        leftHorizontalLine.axis = .vertical
        leftHorizontalLine.addArrangedSubview(spacingView1)
        leftHorizontalLine.addArrangedSubview(leftLine)
        leftHorizontalLine.addArrangedSubview(spacingView2)
        leftLine.backgroundColor = UIColor(named: "gray_E3E8F1")
        
        rightHorizontalLine.axis = .vertical
        rightHorizontalLine.addArrangedSubview(spacingView3)
        rightHorizontalLine.addArrangedSubview(rightLine)
        rightHorizontalLine.addArrangedSubview(spacingView4)
        rightLine.backgroundColor = UIColor(named: "gray_E3E8F1")
        
        NSLayoutConstraint.activate([
            leftLine.heightAnchor.constraint(equalToConstant: 1),
            rightLine.heightAnchor.constraint(equalToConstant: 1),
            spacingView1.heightAnchor.constraint(equalTo: spacingView2.heightAnchor),
            spacingView3.heightAnchor.constraint(equalTo: spacingView4.heightAnchor)
        ])
    }
    
    func setupGoogleAndFacebookSection() {
        let googleImage = UIImageView()
        let facebookImage = UIImageView()
        let spacingView = UIView()
        
        let allViews = [googleBtn, facebookBtn, googleImage, facebookImage, spacingView]
        for view in allViews {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        googleFBContainerView.addArrangedSubview(googleBtn)
        googleFBContainerView.addArrangedSubview(spacingView)
        googleFBContainerView.addArrangedSubview(facebookBtn)
        
        
        googleImage.image = UIImage(named: "google")
        googleImage.contentMode = .scaleAspectFit
        googleBtn.layer.cornerRadius = 20
        googleBtn.layer.borderWidth = 1
        googleBtn.layer.borderColor = UIColor(named: "gray_E3E8F1")?.cgColor
        googleBtn.addSubview(googleImage)
        NSLayoutConstraint.activate([
            googleBtn.topAnchor.constraint(equalTo: googleImage.topAnchor),
            googleBtn.bottomAnchor.constraint(equalTo: googleImage.bottomAnchor),
            googleBtn.leadingAnchor.constraint(equalTo: googleImage.leadingAnchor, constant: -8),
            googleBtn.trailingAnchor.constraint(equalTo: googleImage.trailingAnchor, constant: 8),
            googleImage.widthAnchor.constraint(equalToConstant: 24)
        ])
        
        facebookImage.image = UIImage(named: "Facebook")
        facebookImage.contentMode = .scaleAspectFit
        facebookBtn.layer.cornerRadius = 20
        facebookBtn.clipsToBounds = true
        facebookBtn.layer.borderWidth = 1
        facebookBtn.layer.borderColor = UIColor(named: "gray_E3E8F1")?.cgColor
        facebookBtn.backgroundColor = .clear
        facebookBtn.addSubview(facebookImage)
        NSLayoutConstraint.activate([
            facebookBtn.topAnchor.constraint(equalTo: facebookImage.topAnchor),
            facebookBtn.bottomAnchor.constraint(equalTo: facebookImage.bottomAnchor),
            facebookBtn.leadingAnchor.constraint(equalTo: facebookImage.leadingAnchor, constant: -8),
            facebookBtn.trailingAnchor.constraint(equalTo: facebookImage.trailingAnchor, constant: 8),
            facebookImage.widthAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            googleFBContainerView.topAnchor.constraint(equalTo: horizontalView.bottomAnchor, constant: 31),
            googleFBContainerView.widthAnchor.constraint(equalToConstant: 100),
            googleFBContainerView.heightAnchor.constraint(equalToConstant: 42),
            googleFBContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupAskSignUpSection() {
        let containerView = UIStackView()
        let titleLbl = UILabel()
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addArrangedSubview(titleLbl)
        containerView.addArrangedSubview(signUpBtn)
        
        titleLbl.text = "Don't have an account? "
        titleLbl.font = UIFont(name: "Roboto-Regular", size: 14)
        titleLbl.textColor = UIColor(named: "purple_2C406E")
        
        signUpBtn.backgroundColor = .clear
        signUpBtn.setTitle("Sign Up", for: .normal)
        signUpBtn.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 14)
        signUpBtn.setTitleColor(UIColor(named: "purple_2C406E"), for: .normal)
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -45)
        ])
    }
    
}
