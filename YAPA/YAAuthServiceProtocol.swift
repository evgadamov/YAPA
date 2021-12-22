//
//  YAAuthServiceProtocol.swift
//  YAPA
//
//  Created by Evgeny Adamov on 04/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

protocol YAAuthServiceProtocol {
    
    func register(person: YAPerson, completion: (YARegisterError?) -> Void)
    
    func login(email: String, password: String, completion: (YAPerson?, YALoginError?) -> Void)
    
    func remindPassword(email: String, completion: (YARemindPasswordError?) -> Void)
    
}
