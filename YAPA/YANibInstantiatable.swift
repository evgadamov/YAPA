//
//  YANibInstantiatable.swift
//  YAPA
//
//  Created by Evgeny Adamov on 04/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

import UIKit

protocol YANibInstantiatable {
    static var NibName: String { get }
}

extension YANibInstantiatable {
    
    static var NibName: String {
        return String(describing: Self.self)
    }

    static func instantiate() -> Self {
        return instantiateWithName(name: NibName)
    }

    static func instantiateWithOwner(owner: AnyObject?) -> Self {
        return instantiateWithName(name: NibName, owner: owner)
    }

    static func instantiateWithName(name: String, owner: AnyObject? = nil) -> Self {
        let nib = UINib(nibName: name, bundle: nil)
        guard let view = nib.instantiate(withOwner: owner, options: nil).first as? Self else {
            fatalError("Failed to load \(name) nib file")
        }
        return view
    }
}
