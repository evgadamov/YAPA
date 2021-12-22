//
//  YALoginPresenter.swift
//  YAPA
//
//  Created by Evgeny Adamov on 04/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

import Foundation
import UIKit

class YALoginPresenter: YALoginPresenterProtocol {
    
    weak var view: YALoginViewProtocol!
    var coordinator: YALoginCoordinatorProtocol!
    
    func login(withEmail email: String, password: String) {
        
        let authService = YAServiceGatewayService().authService!
        
        authService.login(email: email, password: password) { (person, error) in
            if let error = error {
                var errorStr: String
                switch error {
                case .invalidEmailOrPassword:
                    errorStr = "Неправильный логин или пароль."
                case .userBlocked:
                    errorStr = "Пользователь был заблокирован. Обратитесь к администратору."
                case .networkError:
                    errorStr = "Ошибка сети. Проверьте интернет."
                case .unknownError(let text):
                    errorStr = text
                }
                view?.showError(with: errorStr)
            } else if let person = person {
                proceedLogin(with: person)
            } else {
                view?.showError(with: "Неизвестная ошибка")
            }
        }
    }
    
    func goToRegisterScreen(navigation: YANavigationProtocol?) {
        coordinator.goToRegisterScreen(navigation: navigation)
    }
    
    func showRemindPasswordScreen(navigation: YANavigationProtocol?) {
        coordinator.showRemindPasswordScreen(navigation: navigation)
    }
    
    /*
     Private functions.
     */
    
    private func proceedLogin(with person: YAPerson) {
        
        NSLog("Login Presenter: login succeed with email - \(person.email ?? ""). user id = \(person.id ?? "")")
        
        let storageService = YAServiceGatewayService().localStorageService!
        storageService.person = person
        
        coordinator.goToMainScreen(navigation: view.navigation)
    
    }

}
