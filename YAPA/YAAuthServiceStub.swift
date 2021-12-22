//
//  YAAuthServiceStub.swift
//  YAPA
//
//  Created by Evgeny Adamov on 04/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

class YAAuthServiceStub: YAAuthServiceProtocol {
    
    func register(person: YAPerson, completion: (YARegisterError?) -> Void) {
        
        if person.email == "123" {
            completion(.emailAlreadyRegistered)
        } else {
            completion(nil)
        }
        
    }
    
    func login(email: String, password: String, completion: (YAPerson?, YALoginError?) -> Void) {
       
        if email == "baduser@mail.com" {
            completion(nil, .userBlocked)
        } else if email == "123" && password == "123" {
            let person = YAPerson(id: "1", name: "Ivan Petrovitsch", email: "123", password: nil, role: .teamlead)
            completion(person, nil)
        } else {
            completion(nil, .invalidEmailOrPassword)
        }
        
    }
    
    func remindPassword(email: String, completion: (YARemindPasswordError?) -> Void) {
        
        if email == "baduser@mail.com" {
            completion(.unknownError("Этот пользователь заблокирован. Восстановление пароля невозможно."))
        } else if email == "123" {
            completion(nil)
        } else {
            completion(.emailNotExist)
        }
        
    }
    
}

