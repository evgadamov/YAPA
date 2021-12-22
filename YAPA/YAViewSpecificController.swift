//
//  YAViewSpecificController.swift
//  YAPA
//
//  Created by Alan on 06/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

import UIKit

protocol YAViewSpecificController {
    associatedtype RootView: UIView
}

extension YAViewSpecificController where Self: UIViewController {
    func view() -> RootView {
        return view as! RootView
    }
}
