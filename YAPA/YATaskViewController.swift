//
//  YATaskViewController.swift
//  YAPA
//
//  Created by Alan on 05/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

import UIKit

class YATaskViewController: UIViewController, YATaskViewProtocol {
    
    var presenter: YATaskPresenterProtocol!
    
    private let task: YATask

    init(task: YATask) {
        self.task = task

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view().configure(with: task)
    }
    
}

extension YATaskViewController: YAViewSpecificController {
    
    // To specify view.
    typealias RootView = YATaskView
    
}
