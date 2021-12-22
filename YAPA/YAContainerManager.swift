//
//  YAContainerManager.swift
//  YAPA
//
//  Created by Evgeny Adamov on 04/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

import Swinject

class YAContainerManager {
    
    static var shared = YAContainerManager()
    
    let container = Container()
    
    init() {
        #if DEBUG
            registerDebugDI()
        #else
            registerReleaseDI()
        #endif
    }
    
    /// Start function to let init shared instance from the delegate finish method.
    func start() { }
        
    private func registerDebugDI() {
        
        /* Services */
        
        // Auth service
        container.register(YAAuthServiceProtocol.self) { _ in YAAuthServiceStub() }
        
        // Settings service
        container.register(YASettingsServiceProtocol.self) { _ in YASettingsServiceStub() }
        
        // Local storage service
        container.register(YALocalStorageServiceProtocol.self) { _ in YALocalStorageServiceDefaults() }
                        
        /* Screens */
        
        // Register screen
        container.register(YARegisterCoordinatorProtocol.self)  { _ in YARegisterCoordinator() }
        container.register(YARegisterPresenterProtocol.self) { _ in YARegisterPresenter() }
        container.register(YARegisterViewProtocol.self) { _ in YARegisterViewController.instantiate() }
        
        // Login screen
        container.register(YALoginCoordinatorProtocol.self) { _ in YALoginCoordinator() }
        container.register(YALoginPresenterProtocol.self) { _ in YALoginPresenter() }
        container.register(YALoginViewProtocol.self) { _ in YALoginViewController.instantiate() }

        // Remind password screen
        container.register(YARemindPasswordCoordinatorProtocol.self)  { _ in YARemindPasswordCoordinator() }
        container.register(YARemindPasswordPresenterProtocol.self) { _ in YARemindPasswordPresenter() }
        container.register(YARemindPasswordViewProtocol.self) { _ in YARemindPasswordViewController.instantiate() }
        
        // Sprint settings
        container.register(YASprintSettingsCoordinatorProtocol.self)  { _ in YASprintSettingsCoordinator() }
        container.register(YASprintSettingsPresenterProtocol.self)  { _ in YASprintSettingsPresenter() }
        container.register(YASprintSettingsViewProtocol.self)  { _ in YASprintSettingsViewController.instantiate() }
        
        // Task screen
        container.register(YATaskCoordinatorProtocol.self) { _ in
            YATaskCoordinator() }
        container.register(YATaskViewProtocol.self) { _ in
            YATaskViewController(task: YATask()) }
        container.register(YATaskPresenterProtocol.self) { _ in
            YATaskPresenter() }

    }
    
    private func registerReleaseDI() {
        // TODO: Add release classes and DI container registration.
    }
    
}
