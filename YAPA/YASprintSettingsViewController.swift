//
//  YASprintSettingsViewController.swift
//  YAPA
//
//  Created by Evgeny Adamov on 05/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

import UIKit

class YASprintSettingsViewController: YABaseViewController, YASprintSettingsViewProtocol {
    
    var presenter: YASprintSettingsPresenterProtocol!
    
    var progress: UIActivityIndicatorView!
    
    @IBOutlet weak var sprintSegmented: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                        
        sprintSegmented.addTarget(self, action: #selector(didChangeSprint(segmented:)), for: .valueChanged)
        
        addIndicator()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        progress.startAnimating()
        presenter.receiveSprintSettings()
    }
    
    private func addIndicator() {
        guard progress == nil else {
            return
        }
        progress = UIActivityIndicatorView(style: .large)
        view.addSubview(progress)
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        progress.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func selectSprintSetting(with numberOfWeeks: Int) {
        DispatchQueue.main.async {
            self.progress.stopAnimating()
            self.sprintSegmented.selectedSegmentIndex = min(2, numberOfWeeks-1)
        }
    }
    
    @objc func didChangeSprint(segmented: UISegmentedControl) {
        NSLog("did change segmented to: \(segmented.selectedSegmentIndex)")
    }
    
    func showError(with text: String) {
        DispatchQueue.main.async {
            self.showAlert(title: "Ошибка", text: text)
        }
    }
        
}
