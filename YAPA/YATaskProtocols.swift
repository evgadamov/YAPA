//
//  YATaskProtocols.swift
//  YAPA
//
//  Created by Alan on 07/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

protocol YATaskCoordinatorProtocol {
    
    func create() -> YAScreen?
    
}

protocol YATaskViewProtocol: AnyObject {
    
    var presenter: YATaskPresenterProtocol! { get set }
    
}

protocol YATaskPresenterProtocol: AnyObject {
    
     var view: YATaskViewProtocol! { get set }
    
}
