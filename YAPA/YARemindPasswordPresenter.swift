//
//  YARemindPasswordPresenter.swift
//  YAPA
//
//  Created by Evgeny Adamov on 04/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

import UIKit

class YARemindPasswordPresenter: YARemindPasswordPresenterProtocol {
    
    weak var view: YARemindPasswordViewProtocol!
    var coordinator: YARemindPasswordCoordinatorProtocol!
    
    func remind(toEmail email: String) {
        
        let authService = YAServiceGatewayService().authService!
        
        authService.remindPassword(email: email) { error in
            if let error = error {
                switch error {
                case .emailNotExist:
                    view.showRemindError(withText: "Пользователь не найден")
                case .networkError:
                    view.showRemindError(withText: "Ошибка сети. Проверьте интернет")
                case .unknownError(let text):
                    view.showRemindError(withText: text)
                }
            } else {
                view.showRemindSuccess()
            }
        }
        
        NSLog("Remind Password Presenter: Remind to \(email)")
    }
    
}
