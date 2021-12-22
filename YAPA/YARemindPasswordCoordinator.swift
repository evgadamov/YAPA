//
//  YARemindPasswordCoordinator.swift
//  YAPA
//
//  Created by Evgeny Adamov on 04/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

import UIKit

class YARemindPasswordCoordinator: YARemindPasswordCoordinatorProtocol {
    
    static func create() -> YAScreen? {
        
        let container = YAContainerManager.shared.container
        
        let view = container.resolve(YARemindPasswordViewProtocol.self)!
        let presenter = container.resolve(YARemindPasswordPresenterProtocol.self)!
        let coordinator = container.resolve(YARemindPasswordCoordinatorProtocol.self)!
        
        presenter.view = view
        presenter.coordinator = coordinator
        
        view.presenter = presenter

        return view as? YAScreen
    }
    
}
