//
//  UILabel.swift
//  Dailoz
//
//  Created by mike on 18/08/2023.
//

import UIKit

extension UILabel {
    
    func customStyleLabel(fontName: String,
                          fontSize: CGFloat,
                          textColor: String,
                          labelContent: String,
                          textAlignment: NSTextAlignment = .center) {
        self.font = UIFont(name: fontName, size: fontSize)
        self.textColor = UIColor(named: textColor)
        self.text = labelContent
        self.textAlignment = textAlignment
    }
    
}
