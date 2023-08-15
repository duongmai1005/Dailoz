//
//  SignUpViewController.swift
//  Dailoz
//
//  Created by mike on 15/08/2023.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var titleLbl = UILabel()
    var userNameTF = CustomTextField()
    var emailTF = CustomTextField()
    var passwordTF = CustomTextField()
    var createAccountBtn = UIButton()
    var horizontalView = UIStackView()
    var googleFBContainerView = UIStackView()
    var googleBtn = UIButton()
    var facebookBtn = UIButton()
    var loginBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        handleBtnTap()
        setupView()
    }
    
    private func handleBtnTap() {
        googleBtn.addTarget(self, action: #selector(loginWithGoogleBtnTap), for: .touchUpInside)
        facebookBtn.addTarget(self, action: #selector(loginWithFacebookBtnTap), for: .touchUpInside)
        loginBtn.addTarget(self, action: #selector(loginBtnTap), for: .touchUpInside)
    }
    
    @objc private func loginWithGoogleBtnTap() {
        print("Đăng nhập thành công với Google")
    }
    
    @objc private func loginWithFacebookBtnTap() {
        print("Đăng nhập thành công với Facebook")
    }
    
    @objc private func loginBtnTap() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setupView() {
        let subViews = [titleLbl, userNameTF, emailTF, passwordTF, createAccountBtn, horizontalView, googleFBContainerView]
        for subView in subViews {
            // important for autolayout
            subView.translatesAutoresizingMaskIntoConstraints = false
            // add view to the superview
            view.addSubview(subView)
        }
        setupTitle()
        setupUserNameTF()
        setupEmailTF()
        setupPasswordTF()
        setupCreateAccountBtn()
        setupHorizontalLine()
        setupGoogleAndFacebookSection()
        setupAskSignUpSection()
    }
    
    private func setupTitle() {
        titleLbl.text = "Sign Up"
        titleLbl.font = UIFont(name: "Roboto-Bold", size: 36)
        titleLbl.textColor = UIColor(named: "primary_purple")
        
        NSLayoutConstraint.activate([
            titleLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            titleLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ])
    }
    
    private func setupUserNameTF() {
        userNameTF.setupTextFields(placeholder: "Username", image: "Message")
        userNameTF.hideTextIcon.isHidden = true
        NSLayoutConstraint.activate([
            userNameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            userNameTF.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 88),
            userNameTF.containerView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func setupEmailTF() {
        emailTF.setupTextFields(placeholder: "Email ID", image: "Lock")
        emailTF.hideTextIcon.isHidden = true
        NSLayoutConstraint.activate([
            emailTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            emailTF.topAnchor.constraint(equalTo: userNameTF.bottomAnchor, constant: 24),
            emailTF.containerView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func setupPasswordTF() {
        passwordTF.setupTextFields(placeholder: "Password", image: "Lock")
        passwordTF.hideTextIcon.isHidden = true
        NSLayoutConstraint.activate([
            passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            passwordTF.topAnchor.constraint(equalTo: emailTF.bottomAnchor, constant: 24),
            passwordTF.containerView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func setupCreateAccountBtn() {
        createAccountBtn.setTitle("Create", for: .normal)
        createAccountBtn.backgroundColor = UIColor(named: "primary_purple")
        createAccountBtn.layer.cornerRadius = 15
        createAccountBtn.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 16)
        NSLayoutConstraint.activate([
            createAccountBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createAccountBtn.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 56),
            createAccountBtn.widthAnchor.constraint(equalToConstant: 300),
            createAccountBtn.heightAnchor.constraint(equalToConstant: 52)
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
            horizontalView.topAnchor.constraint(equalTo: createAccountBtn.bottomAnchor, constant: 54),
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
        let textLbl = UILabel()
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        textLbl.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addArrangedSubview(textLbl)
        containerView.addArrangedSubview(loginBtn)
        
        textLbl.text = "Have any account? "
        textLbl.font = UIFont(name: "Roboto-Regular", size: 14)
        textLbl.textColor = UIColor(named: "purple_2C406E")
        
        loginBtn.backgroundColor = .clear
        loginBtn.setTitle("Sign In", for: .normal)
        loginBtn.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 14)
        loginBtn.setTitleColor(UIColor(named: "purple_2C406E"), for: .normal)
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -45)
        ])
    }
}
