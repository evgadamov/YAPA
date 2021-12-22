//
//  YASettingsServiceStub.swift
//  YAPA
//
//  Created by Evgeny Adamov on 05/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

import Foundation

class YASettingsServiceStub: YASettingsServiceProtocol {
    
    func getSprintSettings(for teamleadId: String, completion: @escaping (YASprintSettings?, YASprintSettingsError?) -> Void) {
        
        DispatchQueue.global().async {
           
            // Network call imitation.
            Thread.sleep(forTimeInterval: 1.5)
            
            if teamleadId == "1" {
                let settings = YASprintSettings(durationInWeeks: .threeWeeks)
                completion(settings, nil)
            } else if teamleadId == "2" {
                completion(nil, .userNotLead)
            } else {
                completion(nil, .networkError)
            }

        }
        
    }
    
}
