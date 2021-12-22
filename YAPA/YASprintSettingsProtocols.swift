//
//  YASprintSettingsProtocols.swift
//  YAPA
//
//  Created by Evgeny Adamov on 05/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

protocol YASprintSettingsCoordinatorProtocol {
    
    static func create() -> YAScreen?
    
}

protocol YASprintSettingsPresenterProtocol: class {
    
    var view: YASprintSettingsViewProtocol! { get set }
    var coordinator: YASprintSettingsCoordinatorProtocol! { get set }
    
    func receiveSprintSettings()
    
}

protocol YASprintSettingsViewProtocol: class {
    
    var presenter: YASprintSettingsPresenterProtocol! { get set }

    func selectSprintSetting(with numberOfWeeks: Int)
    
    func showError(with text: String)
    
}
