//
//  OnboardingViewController.swift
//  Dailoz
//
//  Created by mike on 14/08/2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    let onboardingImageView = UIImageView()
    let titleLbl = UILabel()
    let descriptionLbl = UILabel()
    let loginBtn = UIButton()
    let signupBtn = UIButton()
    
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
        for subView in subViews {
            // important for autolayout
            subView.translatesAutoresizingMaskIntoConstraints = false
            
            // add view to the superview
            view.addSubview(subView)
        }
        
        navigationController?.navigationBar.isHidden = true
        setupImageView()
        setupTitle()
        setupDescription()
        setupLoginBtn()
        setupSignupBtn()
    }
    
    @objc private func signUpBtnTap() {
        let signUpVC = SignUpViewController()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    @objc private func loginBtnTap() {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    private func setupImageView() {
        let onboardingImage = UIImage(named: "onboarding_ico")
        onboardingImageView.image = onboardingImage
        onboardingImageView.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            onboardingImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            onboardingImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42),
            onboardingImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            onboardingImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2)
        ])
    }
    
    private func setupTitle() {
        titleLbl.text = "Dailoz."
        titleLbl.font = UIFont(name: "Roboto-Regular", size: 32)
        titleLbl.textColor = UIColor(named: "primary_purple")
        
        NSLayoutConstraint.activate([
            titleLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLbl.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupDescription() {
        descriptionLbl.font = UIFont(name: "Roboto-Regular", size: 14)
        descriptionLbl.textColor = UIColor(named: "purple_2C406E")
        descriptionLbl.text = "Plan what you will do to be more organized for today, tomorrow and beyond"
        descriptionLbl.textAlignment = .center
        descriptionLbl.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            descriptionLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 28),
            descriptionLbl.widthAnchor.constraint(equalToConstant: 323),
            descriptionLbl.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupLoginBtn() {
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.backgroundColor = UIColor(named: "primary_purple")
        loginBtn.layer.cornerRadius = 15
        loginBtn.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 16)
        NSLayoutConstraint.activate([
            loginBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginBtn.topAnchor.constraint(equalTo: descriptionLbl.bottomAnchor, constant: 66),
            loginBtn.widthAnchor.constraint(equalToConstant: 300),
            loginBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupSignupBtn() {
        signupBtn.setTitle("Sign Up", for: .normal)
        signupBtn.setTitleColor(UIColor(named: "primary_purple"), for: .normal)
        signupBtn.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 14)
        signupBtn.backgroundColor = .clear
        NSLayoutConstraint.activate([
            signupBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signupBtn.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 20),
            signupBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -56)
        ])
    }
    
}
