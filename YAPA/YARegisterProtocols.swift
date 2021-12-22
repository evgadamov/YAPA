//
//  YARegisterProtocols.swift
//  YAPA
//
//  Created by Evgeny Adamov on 04/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

protocol YARegisterCoordinatorProtocol {
    
    static func create() -> YAScreen?
   
    /// Move user to login screen (probably already has account).
    func goToLoginScreen(navigation: YANavigationProtocol?)

}

protocol YARegisterPresenterProtocol: class {
    
    var view: YARegisterViewProtocol! { get set }
    var coordinator: YARegisterCoordinatorProtocol! { get set }
    
    /// Register user in system.
    /// - Parameters:
    ///   - name: User name.
    ///   - email: Email.
    ///   - password: Password (should be encrypted by MD5).
    ///   - role: User's role.
    func register(with name: String, email: String, password: String, role: YARole)
    
    /// Moves user to login screen (probably already has account).
    func goToLoginScreen(navigation: YANavigationProtocol?)
    
}

protocol YARegisterViewProtocol: class {
     
    var presenter: YARegisterPresenterProtocol! { get set }
    
    func showError(with text: String)
    
    func showSuccess()
    
}

