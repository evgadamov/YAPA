//
//  YAUserDefaultsCustom.swift
//  YAPA
//
//  Created by Evgeny Adamov on 05/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

import Foundation

@propertyWrapper struct YAUserDefaultsCustom<T: Codable> {
    
    let key: String
    private let standard = UserDefaults.standard

    var wrappedValue: T? {
        get {
            guard let data = standard.value(forKey: key) as? Data else { return nil }
            return try? PropertyListDecoder().decode(T.self, from: data)
        }
        set {
            guard let data = try? PropertyListEncoder().encode(newValue) else { return }
            standard.set(data, forKey: key)
        }
    }
}
