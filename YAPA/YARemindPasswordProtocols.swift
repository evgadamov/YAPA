//
//  YARemindPasswordProtocols.swift
//  YAPA
//
//  Created by Evgeny Adamov on 04/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

protocol YARemindPasswordCoordinatorProtocol {
    
    static func create() -> YAScreen?
    
}

protocol YARemindPasswordPresenterProtocol: class {
    
    var view: YARemindPasswordViewProtocol! { get set }
    var coordinator: YARemindPasswordCoordinatorProtocol! { get set }
    
    func remind(toEmail email: String)
    
}

protocol YARemindPasswordViewProtocol: class {
    
    var presenter: YARemindPasswordPresenterProtocol! { get set }
        
    func showRemindSuccess()
    
    func showRemindError(withText text: String)

}
