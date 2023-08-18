//
//  UIView.swift
//  Dailoz
//
//  Created by mike on 18/08/2023.
//

import UIKit

extension UIView {
    
    func useAutoLayout(views: [UIView]) {
        for view in views {
            // important for autolayout
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func addSubViewsToSuperView(views: [UIView]) {
        for view in views {
            // add view to the superview
            addSubview(view)
        }
    }
    
}
