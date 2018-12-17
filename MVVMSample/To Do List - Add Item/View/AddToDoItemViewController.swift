//
//  AddToDoItemViewController.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 17.12.18.
//  Copyright © 2018 adesso mobile solutions GmbH. All rights reserved.
//

import UIKit

final class AddToDoItemViewController: UIViewController {
    
    var viewModel: AddToDoItemViewModel! {
        didSet {
            setUpBindings(with: viewModel)
        }
    }
    
    private func setUpBindings(with viewModel: AddToDoItemViewModel) {
        
        viewModel.nameDidChange = { _ in }
        viewModel.dueDateStringDidChange = { _ in }
        viewModel.isFormValidDidChange = { _ in }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = NSLocalizedString("Neue Aufgabe", comment: "")
        installCancelBarButton()
        
        // TODO: Read view model and set contents of outlets
    }
    
    private func installCancelBarButton() {
        
        let button = makeCancelBarButton(target: viewModel, action: #selector(AddToDoItemViewModel.cancel))
        navigationItem.rightBarButtonItem = button
    }
    
    private func makeCancelBarButton(target: Any, action: Selector) -> UIBarButtonItem {
        
        let button = UIBarButtonItem(barButtonSystemItem: .cancel, target: target, action: action)
        
        return button
    }
}
