//
//  YAAuthRouter.swift
//  YAPA
//
//  Created by Evgeny Adamov on 05/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

import UIKit

class YAAuthRouter {
    
    /// Returns main screen according to user's role or, if user not found, returns registration screen.
    static func getMainScreen() -> UIViewController? {
        
        let storageService = YAServiceGatewayService().localStorageService

        guard let person = storageService?.person, let role = person.role else {
            return YARegisterCoordinator.create() as? UIViewController
        }

        switch role {
        case .teamlead:
            return YALeadTabBarCoordinator.create() as? UIViewController
        case .developer:
            return YADeveloperTabBarCoordinator.create() as? UIViewController
        }

    }
    
}
