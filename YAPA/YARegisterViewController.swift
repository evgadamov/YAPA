//
//  YARegisterViewController.swift
//  YAPA
//
//  Created by Evgeny Adamov on 04/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

import UIKit

class YARegisterViewController: YABaseViewController, YARegisterViewProtocol {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var presenter: YARegisterPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        NSLog("register vc loaded")
    }
    
    @IBAction func didTapAlreadyHasAccount(_ sender: UIButton) {
        presenter.goToLoginScreen(navigation: navigationController)
    }
    
    @IBAction func didTapRegister(_ sender: UIButton) {
        guard let name = nameTextField.text, name != .empty,
            let email = emailTextField.text, email != .empty,
            let password = passwordTextField.text, password != .empty
        else {
            showAlert(title: "Ошибка", text: "Введите все данные")
            return
        }
        presenter.register(with: name, email: email, password: password, role: .teamlead)
    }
    
    func showError(with text: String) {
        showAlert(title: "Ошибка", text: text)
    }
    
    func showSuccess() {
        showAlert(title: "Успех", text: "Вы успешно зарегистрировались.") { [weak self] in
            self?.presenter.goToLoginScreen(navigation: self?.navigationController)
        }
    }
    
}
