//
//  UIStackView.swift
//  Dailoz
//
//  Created by mike on 18/08/2023.
//

import UIKit

extension UIStackView {
    
    func addSubViewRespectively(views: [UIView]) {
        for view in views {
            addArrangedSubview(view)
        }
    }
    
}
