//
//  YARegisterPresenter.swift
//  YAPA
//
//  Created by Evgeny Adamov on 04/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

import Foundation
import UIKit

class YARegisterPresenter: YARegisterPresenterProtocol {
    
    weak var view: YARegisterViewProtocol!
    
    var coordinator: YARegisterCoordinatorProtocol!
    
    func register(with name: String, email: String, password: String, role: YARole) {
        
        let person = YAPerson(id: nil, name: name, email: email, password: password, role: role)
        let authService = YAServiceGatewayService().authService!
        
        authService.register(person: person) { (error) in
            if let error = error {
                var errorStr: String
                switch error {
                case .emailAlreadyRegistered:
                    errorStr = "error: user already exist"
                case .networkError:
                    errorStr = "error: network error"
                case .unknownError(let text):
                    errorStr = "error: unknown error - \(text)"
                }
                view?.showError(with: errorStr)
            } else {
                NSLog("register successed. for name: \(name). password: \(password).")

                view?.showSuccess()
            }
        }
        
    }
    
    func goToLoginScreen(navigation: YANavigationProtocol?) {
        NSLog("Presenter: go to login pushed")
        coordinator.goToLoginScreen(navigation: navigation)
    }
    
    
}
