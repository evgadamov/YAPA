//
//  YAUserDefaultsCommon.swift
//  YAPA
//
//  Created by Evgeny Adamov on 05/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

import Foundation

@propertyWrapper struct YAUserDefaultsCommon<T> {
    
    let key: String
    private let standard = UserDefaults.standard

    var wrappedValue: T? {
        get { return standard.value(forKey: key) as? T }
        set { standard.set(newValue, forKey: key) }
    }
}
