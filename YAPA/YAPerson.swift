//
//  YAPerson.swift
//  YAPA
//
//  Created by Evgeny Adamov on 04/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

struct YAPerson: Codable {
    
    var id: String?
    var name: String?
    var email: String?
    var password: String?
    var role: YARole?
    
}
