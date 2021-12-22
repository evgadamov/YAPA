//
//  YASettingsServiceProtocol.swift
//  YAPA
//
//  Created by Evgeny Adamov on 05/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

protocol YASettingsServiceProtocol {
    
    func getSprintSettings(for teamleadId: String, completion: @escaping (YASprintSettings?, YASprintSettingsError?) -> Void)

}
