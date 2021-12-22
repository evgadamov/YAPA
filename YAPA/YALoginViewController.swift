//
//  YALoginViewController.swift
//  YAPA
//
//  Created by Evgeny Adamov on 04/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

import UIKit

class YALoginViewController: YABaseViewController, YALoginViewProtocol {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var presenter: YALoginPresenterProtocol!
    
    var navigation: YANavigationProtocol? {
        return navigationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        NSLog("login screen loaded")
    }
    
    @IBAction func didTapLogin(_ sender: UIButton) {
        guard let email = emailTextField.text, email != .empty,
            let password = passwordTextField.text, password != .empty
        else {
            showAlert(title: "Ошибка", text: "Введите все данные")
            return
        }
        presenter.login(withEmail: email, password: password)
    }
    
    @IBAction func didTapRegister(_ sender: UIButton) {
        presenter.goToRegisterScreen(navigation: navigationController)
    }
    
    @IBAction func didTapRemindPassword(_ sender: UIButton) {
        presenter.showRemindPasswordScreen(navigation: navigationController)
    }
    
    func showError(with text: String) {
        showAlert(title: "Ошибка", text: text)
    }
    
}
