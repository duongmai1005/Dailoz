//
//  OnboardingViewController.swift
//  Dailoz
//
//  Created by mike on 14/08/2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    static let shared = OnboardingViewController()
    
    let onboardingImageView = UIImageView()
    let titleLbl = UILabel()
    let descriptionLbl = UILabel()
    let loginBtn = UIButton()
    let signupBtn = UIButton()
    var isNewUser: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        handleBtnTap()
    }
    
    private func handleBtnTap() {
        loginBtn.addTarget(self, action: #selector(loginBtnTap), for: .touchUpInside)
        signupBtn.addTarget(self, action: #selector(signUpBtnTap), for: .touchUpInside)
    }
    
    private func setupView() {
        let subViews = [onboardingImageView, titleLbl, descriptionLbl, loginBtn, signupBtn]
        view.addSubViewsToSuperView(views: subViews)
        view.useAutoLayout(views: subViews)
        navigationController?.navigationBar.isHidden = true
        setupImageView()
        setupTitle()
        setupDescription()
        setupLoginBtn()
        setupSignupBtn()
    }
    
    private func setUpNewVC() {
        let vc = [LoginViewController(), SignUpViewController()]
        navigationController?.setViewControllers(vc, animated: true)
    }
    
    @objc private func signUpBtnTap() {
        setUpNewVC()
    }
    
    @objc private func loginBtnTap() {
        let vc = [SignUpViewController(), LoginViewController()]
        navigationController?.setViewControllers(vc, animated: true)
    }
    
    private func setupImageView() {
        onboardingImageView.customStyleImageView(imageName: onboardindImage,
                                                 contentMode: .scaleAspectFit)
        NSLayoutConstraint.activate([
            onboardingImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            onboardingImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42),
            onboardingImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            onboardingImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2)
        ])
    }
    
    private func setupTitle() {
        titleLbl.customStyleLabel(fontName: fontRobotoRegular,
                                  fontSize: fs_32,
                                  textColor: purple_5B67CA,
                                  labelContent: onboardingTitle)
        NSLayoutConstraint.activate([
            titleLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLbl.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupDescription() {
        descriptionLbl.customStyleLabel(fontName: fontRobotoRegular,
                                        fontSize: fs_14,
                                        textColor: blue_2C406E,
                                        labelContent: onboardingDescription)
        descriptionLbl.numberOfLines = 0
        NSLayoutConstraint.activate([
            descriptionLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 28),
            descriptionLbl.widthAnchor.constraint(equalToConstant: 323),
            descriptionLbl.heightAnchor.constraint(equalToConstant: 40)
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
            loginBtn.topAnchor.constraint(equalTo: descriptionLbl.bottomAnchor, constant: 66),
            loginBtn.widthAnchor.constraint(equalToConstant: 300),
            loginBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupSignupBtn() {
        signupBtn.customStyleButton(title: signUpBtnTitle,
                                    color: purple_5B67CA,
                                    fontName: fontRobotoBold,
                                    fontsize: fs_14,
                                    backgroundColor: .clear)
        NSLayoutConstraint.activate([
            signupBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signupBtn.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 20),
            signupBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -56)
        ])
    }
    
}

