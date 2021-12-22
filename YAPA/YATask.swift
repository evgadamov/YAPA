//
//  YATask.swift
//  YAPA
//
//  Created by Evgeny Adamov on 04/04/2020.
//  Copyright © 2020 Evgeny Adamov. All rights reserved.
//

import Foundation

struct YATask {
    
    var id: String?
    var createdBy: YAPerson?
    var assignedTo: YAPerson?
    var dueDate: Date?
    var text: String?
    var status: YATaskStatus?
    
}
