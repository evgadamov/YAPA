//
//  YASprintSettingsPresenter.swift
//  YAPA
//
//  Created by Evgeny Adamov on 05/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

import UIKit

class YASprintSettingsPresenter: YASprintSettingsPresenterProtocol {
    
    weak var view: YASprintSettingsViewProtocol!
    
    var coordinator: YASprintSettingsCoordinatorProtocol!
        
    func receiveSprintSettings() {
        
        guard let user = YAUserService.shared.current, let userId = user.id else {
            return
        }
        
        YAServiceGatewayService().settingsService.getSprintSettings(for: userId) { [weak self] settings, error in
            if let error = error {
                var errorStr: String
                switch error {
                case .userNotLead:
                    errorStr = "Пользователь не имеет доступа к этим настройкам."
                case .networkError:
                    errorStr = "Ошибка сети. Проверьте интернет"
                case .unknownError(let text):
                    errorStr = text
                }
                self?.view?.showError(with: errorStr)
            } else if let duration = settings?.durationInWeeks {
                self?.view?.selectSprintSetting(with: duration.rawValue)
            } else {
                return
            }
        }
    }
    
}


