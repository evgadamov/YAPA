//
//  YASprintSettingsError.swift
//  YAPA
//
//  Created by Evgeny Adamov on 05/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

enum YASprintSettingsError: Error {
    case userNotLead
    case networkError
    case unknownError(String)
}
