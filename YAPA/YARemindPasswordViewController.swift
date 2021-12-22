//
//  YARemindPasswordViewController.swift
//  YAPA
//
//  Created by Evgeny Adamov on 04/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

import UIKit

class YARemindPasswordViewController: YABaseViewController, YARemindPasswordViewProtocol {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    var presenter: YARemindPasswordPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Напоминание пароля"
        
        NSLog("Remind View Controller: loaded")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func didTapRemind(_ sender: UIButton) {
        guard let email = emailTextField.text, email != .empty else {
            showAlert(title: "Ошибка", text: "Введите эл. почту")
            return
        }
        presenter.remind(toEmail: email)
    }
    
    func showRemindSuccess() {
        showAlert(title: "Готово", text: "Проверьте свою почту!") { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
    
    func showRemindError(withText text: String) {
        showAlert(title: "Ошибка", text: text)
    }
    
}
