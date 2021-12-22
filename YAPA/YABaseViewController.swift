//
//  YABaseViewController.swift
//  YAPA
//
//  Created by Evgeny Adamov on 04/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

import UIKit

class YABaseViewController: UIViewController, YANibInstantiatable {
    
    func showAlert(title: String, text: String, action: (() -> Void)? = nil) {
        let alertView = UIAlertController(title: title, message: text, preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "OK", style: .cancel) { _ in
            action?()
        }
        alertView.addAction(actionOk)
        present(alertView, animated: true, completion: nil)
    }
    
}
