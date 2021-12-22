//
//  YATaskView.swift
//  YAPA
//
//  Created by Alan on 06/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

import UIKit

class YATaskView: UIView {
    
    typealias CombinedModel = (person: YAPerson, task: YATask)
    
    @IBOutlet private weak var createdByLabel: UILabel!
    @IBOutlet private weak var assignedToLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var taskTextField: UITextField!
        
    // TODO: move common date formatter with custom formats to `Extension`.
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E, d MMM y"
        return formatter
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupTaskView()
    }
    
    func configure(with task: YATask) {
        guard let person = YAUserService.shared.current else {
            return
        }
        
        updateElements(using: (person, task))
    }
    
}

// MARK: - Private
private extension YATaskView {
    
    /// Setup view.
    func setupTaskView() {
        backgroundColor = .gray
    }
    
    /// Update current UI elements.
    func updateElements(using taskModel: CombinedModel?) {
        createdByLabel.text = taskModel?.task.createdBy?.name
        assignedToLabel.text = taskModel?.task.assignedTo?.name
        dateLabel.text = dateFormatter.string(from: taskModel?.task.dueDate ?? Date())
        statusLabel.text = taskModel?.task.status.map { $0.rawValue }
        taskTextField.text = taskModel?.task.text
        
        // TODO: add some logic in future according to person `Role`.
        if taskModel?.person.role == .teamlead {
            assignedToLabel.backgroundColor = .green
        } else {
            assignedToLabel.backgroundColor = .red
        }
    }
    
}
