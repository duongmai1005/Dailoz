//
//  CustomTabbarViewController.swift
//  Dailoz
//
//  Created by mike on 14/08/2023.
//

import UIKit

class CustomTabbarViewController: UITabBarController, UITabBarControllerDelegate {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.selectedIndex = 1
        setupMiddleButton()
    }
    
    func setupMiddleButton() {
    }
    
}
