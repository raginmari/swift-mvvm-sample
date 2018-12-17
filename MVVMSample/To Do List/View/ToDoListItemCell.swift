//
//  ToDoListItemCell.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 15.12.18.
//  Copyright © 2018 adesso mobile solutions GmbH. All rights reserved.
//

import UIKit

final class ToDoListItemCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var priorityLabel: UILabel!
    
    func setUp(with viewModel: ToDoListItemViewModel) {
        
        titleLabel.text = viewModel.title
        
        dueDateLabel.text = viewModel.dueDateString
        dueDateLabel.isHidden = viewModel.dueDateString == nil
        
        priorityLabel.text = viewModel.priorityString
        priorityLabel.isHidden = viewModel.priorityString == nil
    }
}
