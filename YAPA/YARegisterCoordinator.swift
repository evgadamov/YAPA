//
//  YARegisterCoordinator.swift
//  YAPA
//
//  Created by Evgeny Adamov on 04/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

import UIKit

class YARegisterCoordinator: YARegisterCoordinatorProtocol {
    
    static func create() -> YAScreen? {
        
        let container = YAContainerManager.shared.container

        let view = container.resolve(YARegisterViewProtocol.self)!
        let presenter = container.resolve(YARegisterPresenterProtocol.self)!
        let coordinator = container.resolve(YARegisterCoordinatorProtocol.self)!
        
        view.presenter = presenter
        presenter.view = view
        presenter.coordinator = coordinator
        
        return view as? YAScreen
    }
    
    func goToLoginScreen(navigation: YANavigationProtocol?) {
        
        guard
            let navigation = navigation as? UINavigationController,
            let loginVC = YALoginCoordinator.create() as? UIViewController
            else {
                return
        }
        
        navigation.setViewControllers([loginVC], animated: true)
        
    }
    
}
