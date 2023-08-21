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
    var horizontalView = CustomHorizontalLine()
    var googleFBContainerView = UIStackView()
    var googleBtn = UIButton()
    var facebookBtn = UIButton()
    var signUpBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        passwordTF.tfInput.isSecureTextEntry = true
        userNameTF.tfInput.autocapitalizationType = .none
        passwordTF.tfInput.autocapitalizationType = .none
        handleBtnTap()
        setupView()
    }
    
    private func handleBtnTap() {
        loginBtn.addTarget(self, action: #selector(loginBtnTap), for: .touchUpInside)
        passwordTF.hideTextIcon.addTarget(self, action: #selector(revealPassword), for: .touchUpInside)
        forgotPasswordBtn.addTarget(self, action: #selector(forgotPasswordBtnTap), for: .touchUpInside)
        googleBtn.addTarget(self, action: #selector(loginWithGoogleBtnTap), for: .touchUpInside)
        facebookBtn.addTarget(self, action: #selector(loginWithFacebookBtnTap), for: .touchUpInside)
        signUpBtn.addTarget(self, action: #selector(signUpBtnTap), for: .touchUpInside)
    }
    
    private func setupView() {
        let subViews = [titleLbl, userNameTF, passwordTF, forgotPasswordBtn, loginBtn, horizontalView, googleFBContainerView]
        view.useAutoLayout(views: subViews)
        view.addSubViewsToSuperView(views: subViews)
        setupTitle()
        setupUserNameTF()
        setupPasswordTF()
        setupForgotBtn()
        setupLoginBtn()
        setupHorizontalLine()
        setupGoogleAndFacebookSection()
        setupAskSignUpSection()
    }
    
    private func authentication(username: String, password: String) {
        let homeVC = HomeViewController()
        if username != demoUsername || password != password {
            print("Tên đăng nhập hoặc mật khẩu không chính xác vui lòng nhập lại.")
        } else {
            print("Đăng nhập thành công")
            navigationController?.setViewControllers([homeVC], animated: true)
        }
    }
    
    @objc private func signUpBtnTap() {
        let signUpVC = SignUpViewController()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    @objc private func loginBtnTap() {
        let workItem = DispatchWorkItem { [weak self] in
            self?.authentication(username: self!.userNameTF.tfInput.text ?? "",
                                 password: self!.passwordTF.tfInput.text ?? "")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: workItem)
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
        titleLbl.customStyleLabel(fontName: fontRobotoBold,
                                  fontSize: fs_36,
                                  textColor: purple_5B67CA,
                                  labelContent: login_ScreenTitle)
        NSLayoutConstraint.activate([
            titleLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            titleLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ])
    }
    
    private func setupUserNameTF() {
        userNameTF.setupTextFields(placeholder: login_UsernameTFPlaceholder,
                                   image: userNameTFImage)
        userNameTF.hideTextIcon.isHidden = true
        NSLayoutConstraint.activate([
            userNameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            userNameTF.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 88),
            userNameTF.containerView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func setupPasswordTF() {
        passwordTF.setupTextFields(placeholder: login_PasswordTFPlaceholder,
                                   image: passwordTFImage)
        NSLayoutConstraint.activate([
            passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            passwordTF.topAnchor.constraint(equalTo: userNameTF.bottomAnchor, constant: 24),
            passwordTF.containerView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func setupForgotBtn() {
        forgotPasswordBtn.customStyleButton(title: login_forgotPasswordTitle,
                                            color: purple_5B67CA,
                                            fontName: fontRobotoRegular,
                                            fontsize: fs_12,
                                            backgroundColor: .clear)
        NSLayoutConstraint.activate([
            forgotPasswordBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            forgotPasswordBtn.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 4)
        ])
    }
    
    private func setupLoginBtn() {
        loginBtn.customStyleButton(title: loginBtnTitle,
                                   fontName: fontRobotoBold,
                                   fontsize: fs_16,
                                   backgroundColor: UIColor(named: purple_5B67CA) ?? .white,
                                   cornerRadius: 15)
        NSLayoutConstraint.activate([
            loginBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginBtn.topAnchor.constraint(equalTo: forgotPasswordBtn.bottomAnchor, constant: 56),
            loginBtn.widthAnchor.constraint(equalToConstant: 300),
            loginBtn.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
    
    private func setupHorizontalLine() {
        NSLayoutConstraint.activate([
            horizontalView.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 54),
            horizontalView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            horizontalView.widthAnchor.constraint(equalToConstant: 300),
            horizontalView.heightAnchor.constraint(equalToConstant: 18)
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
        
        googleImage.customStyleImageView(imageName: googleIcon,
                                         contentMode: .scaleAspectFit)
        
        googleBtn.customStyleButton(cornerRadius: 20,
                                    borderWidth: 1,
                                    borderColor: blue_E3E8F1)
        
        googleBtn.addSubview(googleImage)
        NSLayoutConstraint.activate([
            googleBtn.topAnchor.constraint(equalTo: googleImage.topAnchor),
            googleBtn.bottomAnchor.constraint(equalTo: googleImage.bottomAnchor),
            googleBtn.leadingAnchor.constraint(equalTo: googleImage.leadingAnchor, constant: -8),
            googleBtn.trailingAnchor.constraint(equalTo: googleImage.trailingAnchor, constant: 8),
            googleImage.widthAnchor.constraint(equalToConstant: 24)
        ])
        
        facebookImage.customStyleImageView(imageName: facebookIcon,
                                           contentMode: .scaleAspectFit)
        
        facebookBtn.customStyleButton(backgroundColor: .clear,
                                      cornerRadius: 20,
                                      borderWidth: 1,
                                      borderColor: blue_E3E8F1)
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
        
        textLbl.customStyleLabel(fontName: fontRobotoRegular,
                                 fontSize: fs_14,
                                 textColor: blue_2C406E,
                                 labelContent: login_dontHaveAccountLabel)
        
        signUpBtn.customStyleButton(title: signUpBtnTitle,
                                    color: blue_2C406E,
                                    fontName: fontRobotoBold,
                                    fontsize: fs_14,
                                    backgroundColor: .clear)
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -45)
        ])
    }
    
}
