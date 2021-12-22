//
//  YASprintSettingsCoordinator.swift
//  YAPA
//
//  Created by Evgeny Adamov on 05/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

class YASprintSettingsCoordinator: YASprintSettingsCoordinatorProtocol {
    
    static func create() -> YAScreen? {
        
        let container = YAContainerManager.shared.container
        
        let view = container.resolve(YASprintSettingsViewProtocol.self)!
        let presenter = container.resolve(YASprintSettingsPresenterProtocol.self)!
        let coordinator = container.resolve(YASprintSettingsCoordinatorProtocol.self)!
        
        presenter.view = view
        presenter.coordinator = coordinator
        
        view.presenter = presenter

        return view as? YAScreen
    }
    
}
