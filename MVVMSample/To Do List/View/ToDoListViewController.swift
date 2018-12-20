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
            setUpBindings()
        }
    }
    
    private func setUpBindings() {
        
        loadViewIfNeeded()
        
        viewModel.toDoItems.observeNext { [weak self] _ in
            self?.tableView.reloadData()
        }.dispose(in: bag)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = NSLocalizedString("Aufgaben", comment: "")
        installAddToDoItemBarButton()
        
        viewModel.prepareView()
    }
    
    private func installAddToDoItemBarButton() {
        
        let button = makeAddToDoItemBarButton()
        _ = button.reactive.tap.observeNext { [weak self] in
            self?.viewModel.addToDoItem()
        }
        
        navigationItem.rightBarButtonItem = button
    }
    
    private func makeAddToDoItemBarButton() -> UIBarButtonItem {
        
        return UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
    }
    
    private func reloadToDoItems() {
        
        tableView.reloadData()
    }
}

extension ToDoListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.toDoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellReuseIdentifier, for: indexPath)
        guard let itemCell = cell as? ToDoListItemCell else {
            fatalError("Failed to dequeue cell")
        }
        
        let itemViewModel = viewModel.toDoItems[indexPath.row]
        itemCell.setUp(with: itemViewModel)
        
        return itemCell
    }
}
