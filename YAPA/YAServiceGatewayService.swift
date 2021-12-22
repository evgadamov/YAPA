//
//  YAServiceGatewayService.swift
//  YAPA
//
//  Created by Evgeny Adamov on 05/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

class YAServiceGatewayService {
    
    @YAServiceInjection
    var authService: YAAuthServiceProtocol!
    
    @YAServiceInjection
    var localStorageService: YALocalStorageServiceProtocol!
    
    @YAServiceInjection
    var settingsService: YASettingsServiceProtocol!
    
}
