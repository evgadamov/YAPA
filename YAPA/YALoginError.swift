//
//  YALoginError.swift
//  YAPA
//
//  Created by Evgeny Adamov on 04/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

enum YALoginError: Error {
    case invalidEmailOrPassword
    case userBlocked
    case networkError
    case unknownError(String)
}
