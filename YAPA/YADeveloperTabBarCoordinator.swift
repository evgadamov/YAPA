//
//  YADeveloperTabBarCoordinator.swift
//  YAPA
//
//  Created by Evgeny Adamov on 05/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

import UIKit

class YADeveloperTabBarCoordinator {
    
    static func create() -> YAScreen? {
        let tabBar = UITabBarController()
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        tabBar.viewControllers = [vc]
        return tabBar
    }
    
}
