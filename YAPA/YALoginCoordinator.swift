//
//  YALoginCoordinator.swift
//  YAPA
//
//  Created by Evgeny Adamov on 04/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

import UIKit

class YALoginCoordinator: YALoginCoordinatorProtocol {
    
    static func create() -> YAScreen? {
        
        let container = YAContainerManager.shared.container
        
        let view = container.resolve(YALoginViewProtocol.self)!
        let presenter = container.resolve(YALoginPresenterProtocol.self)!
        let coordinator = container.resolve(YALoginCoordinatorProtocol.self)!
        
        presenter.view = view
        presenter.coordinator = coordinator
        
        view.presenter = presenter
        
        return view as? YAScreen
    }
    
    func goToRegisterScreen(navigation: YANavigationProtocol?) {
        guard let navigation = navigation as? UINavigationController,
            let registerVC = YARegisterCoordinator.create() as? UIViewController
        else {
            return
        }
        navigation.setViewControllers([registerVC], animated: true)
    }
    
    func showRemindPasswordScreen(navigation: YANavigationProtocol?) {
        guard let navigation = navigation as? UINavigationController,
            let remindPasswordVC = YARemindPasswordCoordinator.create() as? UIViewController
        else {
            return
        }
        navigation.pushViewController(remindPasswordVC, animated: true)
    }
        
    func goToMainScreen(navigation: YANavigationProtocol?) {
        guard let navigation = navigation as? UINavigationController else { return }
        let mainScreen = YAAuthRouter.getMainScreen()!
        navigation.setViewControllers([mainScreen], animated: true)
    }
    
}
