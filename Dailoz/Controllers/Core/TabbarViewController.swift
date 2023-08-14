//
//  TabbarViewController.swift
//  Dailoz
//
//  Created by mike on 14/08/2023.
//

import UIKit

class TabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    private func setupTabbar() {
        let homeVC = HomeViewController()
        let taskVC = TaskViewController()
        let graphicVC = GraphicViewController()
        let profileVC = ProfileViewController()
        
        let nav1 = UINavigationController(rootViewController: homeVC)
        let nav2 = UINavigationController(rootViewController: taskVC)
        let nav3 = UINavigationController(rootViewController: graphicVC)
        let nav4 = UINavigationController(rootViewController: profileVC)
        
        setViewControllers([nav1, nav2, nav3, nav4], animated: true)
        
    }


}

