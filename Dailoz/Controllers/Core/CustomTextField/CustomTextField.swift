//
//  CustomTextField.swift
//  Dailoz
//
//  Created by mike on 14/08/2023.
//

import UIKit

class CustomTextField: UIView {
    
    let containerView = UIStackView()
    let childContainerView = UIStackView()
    let tfIcon = UIImageView()
    let tfInput = UITextField()
    let underlineView = UIView()
    let hideTextIcon = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        let subViews = [containerView, childContainerView, tfIcon, tfInput, underlineView]
        for subView in subViews {
            // important for autolayout
            subView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addSubview(containerView)
        containerView.axis = .vertical
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
        containerView.spacing = 16
        
        containerView.insertArrangedSubview(childContainerView, at: 0)
        containerView.insertArrangedSubview(underlineView, at: 1)
        setupUnderLineView()
        setupChildContainerView()
    }
    
    func setupChildContainerView() {
        childContainerView.addArrangedSubview(tfIcon)
        childContainerView.addArrangedSubview(tfInput)
        childContainerView.addArrangedSubview(hideTextIcon)
        childContainerView.spacing = 13
        NSLayoutConstraint.activate([
            tfIcon.widthAnchor.constraint(equalToConstant: 24),
            tfIcon.heightAnchor.constraint(equalToConstant: 24)
        ])
        setupHideTextBtn()
    }
    
    func setupTextFields(placeholder: String, image: String) {
        tfIcon.image = UIImage(named: image)
        tfInput.placeholder = placeholder
    }
    
    private func setupUnderLineView() {
        underlineView.backgroundColor = UIColor(named: "gray_E3E8F1")
        NSLayoutConstraint.activate([
            underlineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    private func setupHideTextBtn() {
        let hideImageView = UIImageView(image: UIImage(named: "Hide"))
        hideTextIcon.translatesAutoresizingMaskIntoConstraints = false
        hideTextIcon.addSubview(hideImageView)
        hideTextIcon.backgroundColor = .clear
        NSLayoutConstraint.activate([
            hideImageView.widthAnchor.constraint(equalTo: hideTextIcon.widthAnchor),
            hideImageView.heightAnchor.constraint(equalTo: hideTextIcon.widthAnchor)
        ])
    }
    
}
