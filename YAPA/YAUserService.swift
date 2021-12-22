//
//  YAUserService.swift
//  YAPA
//
//  Created by Evgeny Adamov on 05/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

/// TODO: Do not forget about this service and person storage at instance's variable in user logging off logic.
class YAUserService {
    
    // As for now we use singleton approach.
    static var shared = YAUserService()
    
    private var person: YAPerson?
    
    // For singleton.
    private init() {}
    
    var current: YAPerson? {
        
        guard person == nil else {
            return person
        }
              
        guard let person = YAServiceGatewayService().localStorageService?.person else {
            return nil
        }
        
        self.person = person
        
        return person
    }
    
}
