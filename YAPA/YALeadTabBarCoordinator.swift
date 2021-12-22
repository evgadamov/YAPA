//
//  YALeadTabBarCoordinator.swift
//  YAPA
//
//  Created by Evgeny Adamov on 05/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

import UIKit

class YALeadTabBarCoordinator {
    
    static func create() -> YAScreen? {
      
        let sprintSettings = YASprintSettingsCoordinator.create() as! UIViewController
        let taskList = YATaskListViewController.instantiate()
        
        let sprintSettingsNavigation = UINavigationController(rootViewController: sprintSettings)
        let taskListNavigation = UINavigationController(rootViewController: taskList)
       
        let leadTabBarController = UITabBarController()
        
        let taskListImage = UIImage(named: "tasks")
        let taskListItem = UITabBarItem(title: "Список задач", image: taskListImage, selectedImage: taskListImage)
        taskListNavigation.tabBarItem = taskListItem
        
        let settingsImage = UIImage(named: "settings")
        let settingsItem = UITabBarItem(title: "Настройки", image: settingsImage, selectedImage: settingsImage)
        sprintSettingsNavigation.tabBarItem = settingsItem
        
        leadTabBarController.viewControllers = [taskListNavigation, sprintSettingsNavigation]
        
        return leadTabBarController
    }
    
}
