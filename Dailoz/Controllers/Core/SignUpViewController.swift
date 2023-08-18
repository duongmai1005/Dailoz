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
        view.useAutoLayout(views: subViews)
        view.addSubViewsToSuperView(views: subViews)
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
        titleLbl.customStyleLabel(fontName: fontRobotoBold,
                                  fontSize: fs_36,
                                  textColor: purple_5B67CA,
                                  labelContent: signUp_ScreenTitle)
        
        NSLayoutConstraint.activate([
            titleLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            titleLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ])
    }
    
    private func setupUserNameTF() {
        userNameTF.setupTextFields(placeholder: signUp_usernameTFPlaceholder,
                                   image: userNameTFImage)
        userNameTF.hideTextIcon.isHidden = true
        NSLayoutConstraint.activate([
            userNameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            userNameTF.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 88),
            userNameTF.containerView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func setupEmailTF() {
        emailTF.setupTextFields(placeholder: signUp_emailTFPlaceholder,
                                image: passwordTFImage)
        emailTF.hideTextIcon.isHidden = true
        NSLayoutConstraint.activate([
            emailTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            emailTF.topAnchor.constraint(equalTo: userNameTF.bottomAnchor, constant: 24),
            emailTF.containerView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func setupPasswordTF() {
        passwordTF.setupTextFields(placeholder: signUp_passwordTFPlaceholder,
                                   image: passwordTFImage)
        passwordTF.hideTextIcon.isHidden = true
        NSLayoutConstraint.activate([
            passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            passwordTF.topAnchor.constraint(equalTo: emailTF.bottomAnchor, constant: 24),
            passwordTF.containerView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func setupCreateAccountBtn() {
        createAccountBtn.customStyleButton(title: signUp_createBtnTitle,
                                           fontName: fontRobotoBold,
                                           fontsize: fs_16,
                                           backgroundColor: UIColor(named: purple_5B67CA) ?? .white,
                                           cornerRadius: 15)
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
        view.useAutoLayout(views: allViews)
        horizontalView.addSubViewRespectively(views: mainStackView)
        horizontalView.spacing = 10
        
        NSLayoutConstraint.activate([
            horizontalView.topAnchor.constraint(equalTo: createAccountBtn.bottomAnchor, constant: 54),
            horizontalView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            horizontalView.widthAnchor.constraint(equalToConstant: 300),
            horizontalView.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        textLabel.customStyleLabel(fontName: fontRobotoMedium,
                                   fontSize: fs_12,
                                   textColor: blue_E3E8F1,
                                   labelContent: spacerText)
        NSLayoutConstraint.activate([
            leftHorizontalLine.widthAnchor.constraint(equalToConstant: 120),
            rightHorizontalLine.widthAnchor.constraint(equalToConstant: 120)
        ])
        
        leftHorizontalLine.axis = .vertical
        let leftHorizontalLineStackView = [spacingView1, leftLine, spacingView2]
        leftHorizontalLine.addSubViewRespectively(views: leftHorizontalLineStackView)
        leftLine.backgroundColor = UIColor(named: blue_E3E8F1)
        
        rightHorizontalLine.axis = .vertical
        let rightHorizontalLineStackView = [spacingView3, rightLine, spacingView4]
        rightHorizontalLine.addSubViewRespectively(views: rightHorizontalLineStackView)
        rightLine.backgroundColor = UIColor(named: blue_E3E8F1)
        
        
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
        view.useAutoLayout(views: allViews)
        let stackViewItems = [googleBtn, spacingView, facebookBtn]
        googleFBContainerView.addSubViewRespectively(views: stackViewItems)
        
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
        let allViews = [containerView, textLbl]
        let stackViewItems = [textLbl, loginBtn]
        view.addSubview(containerView)
        
        view.useAutoLayout(views: allViews)
        containerView.addSubViewRespectively(views: stackViewItems)

        textLbl.customStyleLabel(fontName: fontRobotoRegular,
                                 fontSize: fs_14,
                                 textColor: blue_2C406E,
                                 labelContent: signUp_haveAccountLabel)
        loginBtn.customStyleButton(title: loginBtnTitle,
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
