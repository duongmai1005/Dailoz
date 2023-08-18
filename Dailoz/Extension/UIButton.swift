//
//  UIButton.swift
//  Dailoz
//
//  Created by mike on 18/08/2023.
//

import UIKit

extension UIButton {
    
    func customStyleButton(title: String = "Button",
                           color: String = "defaultWhite",
                           fontName: String = "Roboto-Regular",
                           fontsize: CGFloat = 16,
                           backgroundColor: UIColor = UIColor(named: "defaultWhite") ?? .white,
                           cornerRadius: CGFloat = 0,
                           borderWidth: CGFloat = 0,
                           borderColor: String = "defaultWhite") {
        setTitle(title, for: .normal)
        setTitleColor(UIColor(named: color), for: .normal)
        titleLabel?.font = UIFont(name: fontName, size: fontsize)
        self.backgroundColor = backgroundColor
        layer.cornerRadius = cornerRadius
        layer.borderWidth = 1
        layer.borderColor = UIColor(named: borderColor)?.cgColor
    }
    
}
