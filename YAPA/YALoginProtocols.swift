//
//  YALoginProtocols.swift
//  YAPA
//
//  Created by Evgeny Adamov on 04/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

protocol YALoginCoordinatorProtocol {
    
    static func create() -> YAScreen?
    
    /// Move user to register screen (probably need to register first).
    func goToRegisterScreen(navigation: YANavigationProtocol?)
    
    func showRemindPasswordScreen(navigation: YANavigationProtocol?)
        
    func goToMainScreen(navigation: YANavigationProtocol?)

}

protocol YALoginPresenterProtocol: class {
    
    var view: YALoginViewProtocol! { get set }
    var coordinator: YALoginCoordinatorProtocol! { get set }
    
    func login(withEmail email: String, password: String)
    
    /// Moves user to register screen (probably need to register first).
    func goToRegisterScreen(navigation: YANavigationProtocol?)
    
    func showRemindPasswordScreen(navigation: YANavigationProtocol?)

}

protocol YALoginViewProtocol: class {
    
    var presenter: YALoginPresenterProtocol! { get set }
    
    var navigation: YANavigationProtocol? { get }
    
    func showError(with text: String)
    
}


