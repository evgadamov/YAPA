//
//  YALocalStorageServiceDefaults.swift
//  YAPA
//
//  Created by Evgeny Adamov on 05/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

import Foundation

class YALocalStorageServiceDefaults: YALocalStorageServiceProtocol {
    
    @YAUserDefaultsCustom(key: "current-person")
    var person: YAPerson?
    
}
