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
        let signUpVC = SignUpViewController()
        navigationController?.pushViewController(signUpVC, animated: true)
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
        titleLbl.customStyleLabel(fontName: "Roboto-Bold",
                                  fontSize: 36,
                                  textColor: "primary_purple",
                                  labelContent: "Login")
        NSLayoutConstraint.activate([
            titleLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            titleLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ])
    }
    
    private func setupUserNameTF() {
        userNameTF.setupTextFields(placeholder: "Email ID or Username",
                                   image: "Message")
        userNameTF.hideTextIcon.isHidden = true
        NSLayoutConstraint.activate([
            userNameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            userNameTF.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 88),
            userNameTF.containerView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func setupPasswordTF() {
        passwordTF.setupTextFields(placeholder: "Password",
                                   image: "Lock")
        NSLayoutConstraint.activate([
            passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            passwordTF.topAnchor.constraint(equalTo: userNameTF.bottomAnchor, constant: 24),
            passwordTF.containerView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func setupForgotBtn() {
        forgotPasswordBtn.customStyleButton(title: "Forgot Password ?",
                                            color: "primary_purple",
                                            fontName: "Roboto-Regular",
                                            fontsize: 12,
                                            backgroundColor: .clear)
        NSLayoutConstraint.activate([
            forgotPasswordBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            forgotPasswordBtn.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 4)
        ])
    }
    
    private func setupLoginBtn() {
        loginBtn.customStyleButton(title: "Login",
                                   fontName: "Roboto-Bold",
                                   fontsize: 16,
                                   backgroundColor: UIColor(named: "primary_purple") ?? .white,
                                   cornerRadius: 15)
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
        
        view.useAutoLayout(views: allViews)
        horizontalView.addSubViewRespectively(views: mainStackView)
        horizontalView.spacing = 10
        
        NSLayoutConstraint.activate([
            horizontalView.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 54),
            horizontalView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            horizontalView.widthAnchor.constraint(equalToConstant: 300),
            horizontalView.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        textLabel.customStyleLabel(fontName: "Roboto-Medium", fontSize: 12, textColor: "gray_E3E8F1", labelContent: "or with")
        
        NSLayoutConstraint.activate([
            leftHorizontalLine.widthAnchor.constraint(equalToConstant: 120),
            rightHorizontalLine.widthAnchor.constraint(equalToConstant: 120)
        ])
        
        leftHorizontalLine.axis = .vertical
        let leftHorizontalLineStackView = [spacingView1, leftLine, spacingView2]
        leftHorizontalLine.addSubViewRespectively(views: leftHorizontalLineStackView)
        leftLine.backgroundColor = UIColor(named: "gray_E3E8F1")
        
        rightHorizontalLine.axis = .vertical
        let rightHorizontalLineStackView = [spacingView3, rightLine, spacingView4]
        rightHorizontalLine.addSubViewRespectively(views: rightHorizontalLineStackView)
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
        let stackViewItem = [googleBtn, spacingView, facebookBtn]
        let allViews = [googleBtn, facebookBtn, googleImage, facebookImage, spacingView]

        view.useAutoLayout(views: allViews)
        
        googleFBContainerView.addSubViewRespectively(views: stackViewItem)
        
        googleImage.customStyleImageView(imageName: "google",
                                         contentMode: .scaleAspectFit)
        
        googleBtn.customStyleButton(cornerRadius: 20,
                                    borderWidth: 1,
                                    borderColor: "gray_E3E8F1")
        
        googleBtn.addSubview(googleImage)
        NSLayoutConstraint.activate([
            googleBtn.topAnchor.constraint(equalTo: googleImage.topAnchor),
            googleBtn.bottomAnchor.constraint(equalTo: googleImage.bottomAnchor),
            googleBtn.leadingAnchor.constraint(equalTo: googleImage.leadingAnchor, constant: -8),
            googleBtn.trailingAnchor.constraint(equalTo: googleImage.trailingAnchor, constant: 8),
            googleImage.widthAnchor.constraint(equalToConstant: 24)
        ])
        
        facebookImage.customStyleImageView(imageName: "Facebook",
                                           contentMode: .scaleAspectFit)
        
        facebookBtn.customStyleButton(backgroundColor: .clear,
                                      cornerRadius: 20,
                                      borderWidth: 1,
                                      borderColor: "gray_E3E8F1")
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
        let subViews = [containerView, textLbl]
        let stackViewItems = [textLbl, signUpBtn]
        view.addSubview(containerView)
        view.useAutoLayout(views: subViews)
        
        containerView.addSubViewRespectively(views: stackViewItems)
        
        textLbl.customStyleLabel(fontName: "Roboto-Regular",
                                 fontSize: 14,
                                 textColor: "purple_2C406E",
                                 labelContent: "Don't have an account? ")
        
        signUpBtn.customStyleButton(title: "Sign Up",
                                    color: "purple_2C406E",
                                    fontName: "Roboto-Bold",
                                    fontsize: 14,
                                    backgroundColor: .clear)
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -45)
        ])
    }
    
}
