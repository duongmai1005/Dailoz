//
//  UIImageView.swift
//  Dailoz
//
//  Created by mike on 18/08/2023.
//

import UIKit

extension UIImageView {
    
    func customStyleImageView(imageName: String,
                              contentMode: ContentMode = .scaleToFill) {
        self.image = UIImage(named: imageName)
        self.contentMode = contentMode
    }
    
}
