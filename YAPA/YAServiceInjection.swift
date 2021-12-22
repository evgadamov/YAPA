//
//  YAServiceInjection.swift
//  YAPA
//
//  Created by Evgeny Adamov on 05/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

@propertyWrapper struct YAServiceInjection<T> {
    
    var wrappedValue: T {
        let container = YAContainerManager.shared.container
        return container.resolve(T.self)!
    }
    
}
