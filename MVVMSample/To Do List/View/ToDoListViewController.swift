//
//  ToDoListViewController.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 14.12.18.
//  Copyright © 2018 adesso mobile solutions GmbH. All rights reserved.
//

import UIKit

private enum Constants {
    
    static let cellReuseIdentifier = "Item"
}

final class ToDoListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: ToDoListViewModel! {
        didSet {
            setUpBindings(with: viewModel)
        }
    }
    
    private func setUpBindings(with viewModel: ToDoListViewModel) {
        
        loadViewIfNeeded()
        
        viewModel.toDoItems.bind(to: tableView) { viewModels, indexPath, tableView in
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellReuseIdentifier, for: indexPath)
            guard let itemCell = cell as? ToDoListItemCell else {
                fatalError("Failed to dequeue cell")
            }
            
            let itemViewModel = viewModels[indexPath.row]
            itemCell.setUp(with: itemViewModel)
            
            return itemCell
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = NSLocalizedString("Aufgaben", comment: "")
        installAddToDoItemBarButton()
    }
    
    private func installAddToDoItemBarButton() {
        
        let button = makeAddToDoItemBarButton()
        button.reactive.tap.observeNext { [weak self] in
            self?.viewModel.addToDoItem()
        }.dispose(in: bag)
        
        navigationItem.rightBarButtonItem = button
    }
    
    private func makeAddToDoItemBarButton() -> UIBarButtonItem {
        
        return UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
    }
}
