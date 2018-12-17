//
//  AddToDoItemViewController.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 17.12.18.
//  Copyright © 2018 adesso mobile solutions GmbH. All rights reserved.
//

import UIKit

private enum Strings {
    
    static let done = NSLocalizedString("Fertig", comment: "")
}

final class AddToDoItemViewController: UIViewController {
    
    @IBOutlet private weak var dueDateTextField: UITextField!
    @IBOutlet private weak var priorityTextField: UITextField!
    
    var viewModel: AddToDoItemViewModel! {
        didSet {
            setUpBindings(with: viewModel)
        }
    }
    
    private func setUpBindings(with viewModel: AddToDoItemViewModel) {
        
        viewModel.dueDateStringDidChange = { [weak self] viewModel in
            self?.dueDateTextField.text = viewModel.dueDateString
        }
        
        viewModel.priorityStringDidChange = { [weak self ]viewModel in
            self?.priorityTextField.text = viewModel.priorityString
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = NSLocalizedString("Neue Aufgabe", comment: "")
        installCancelBarButton()
        
        setUpDueDateTextField()
        setUpPriorityTextField()
    }
    
    private func installCancelBarButton() {
        
        let button = makeCancelBarButton(target: viewModel, action: #selector(AddToDoItemViewModel.cancel))
        navigationItem.rightBarButtonItem = button
    }
    
    private func setUpDueDateTextField() {
        
        dueDateTextField.text = viewModel.dueDateString
        
        let doneAction = #selector(onDueDatePickerFinished(_:))
        dueDateTextField.inputAccessoryView = WidgetFactory.makeToolbar(buttonTitle: Strings.done, target: self, action: doneAction)
        dueDateTextField.inputView = WidgetFactory.makeDateAndTimePicker(minimumDate: viewModel.minimumDueDate)
    }
    
    private func setUpPriorityTextField() {
        
        priorityTextField.text = viewModel.priorityString
        
        let doneAction = #selector(onPriorityPickerFinished(_:))
        priorityTextField.inputAccessoryView = WidgetFactory.makeToolbar(buttonTitle: Strings.done, target: self, action: doneAction)
        priorityTextField.inputView = WidgetFactory.makePicker(items: viewModel.orderedPriorityStrings)
    }
    
    @objc private func onDueDatePickerFinished(_ sender: Any) {
     
        dueDateTextField.endEditing(false)
        // TODO: Pass the selected to the view model
    }
    
    @objc private func onPriorityPickerFinished(_ sender: Any) {
        
        priorityTextField.endEditing(false)
        
        let selectedIndex = (priorityTextField.inputView as? UIPickerView)?.selectedRow() ?? 0
        viewModel.selectPriority(at: selectedIndex)
    }
    
    private func makeCancelBarButton(target: Any, action: Selector) -> UIBarButtonItem {
        
        let button = UIBarButtonItem(barButtonSystemItem: .cancel, target: target, action: action)
        
        return button
    }
    
}

extension AddToDoItemViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        return true
    }
}
