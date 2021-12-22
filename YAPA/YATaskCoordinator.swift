//
//  YATaskCoordinator.swift
//  YAPA
//
//  Created by Alan on 07/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

final class YATaskCoordinator: YATaskCoordinatorProtocol {
    
    func create() -> YAScreen? {
        
        let container = YAContainerManager.shared.container
        
        let view = container.resolve(YATaskViewProtocol.self)!
        let presenter = container.resolve(YATaskPresenterProtocol.self)!
        
        view.presenter = presenter
        
        presenter.view = view
        
        return view as? YAScreen
    }
    
}
