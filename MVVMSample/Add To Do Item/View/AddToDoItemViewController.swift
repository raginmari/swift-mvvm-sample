//
//  AddToDoItemViewController.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 17.12.18.
//  Copyright © 2018 adesso mobile solutions GmbH. All rights reserved.
//

import UIKit
import Bond
import ReactiveKit

private enum Strings {
    
    static let done = NSLocalizedString("Fertig", comment: "")
}

final class AddToDoItemViewController: UIViewController {
    
    @IBOutlet private weak var saveButton: UIButton! {
        didSet {
            saveButton?.setBackgroundImage(UIImage.image(withColor: UIColor(hex: 0x3498db)), for: .normal)
        }
    }
    
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var dueDateTextField: UITextField!
    @IBOutlet private weak var priorityTextField: UITextField!
    
    var viewModel: AddToDoItemViewModel! {
        didSet {
            setUpBindings(with: viewModel)
        }
    }
    
    private func setUpBindings(with viewModel: AddToDoItemViewModel) {
        
        loadViewIfNeeded()
        
        // Bind view model to name text field
        viewModel.name.bidirectionalBind(to: nameTextField.reactive.text)
        
        // Bind view model to save button
        viewModel.isFormValid.bind(to: saveButton.reactive.isEnabled)
        
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
        
        let button = makeCancelBarButton()
        _ = button.reactive.tap.observeNext { [weak self] in
            self?.viewModel.cancel()
        }
        
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
        // TODO: Pass the selected date to the view model
    }
    
    @objc private func onPriorityPickerFinished(_ sender: Any) {
        
        priorityTextField.endEditing(false)
        
        let selectedIndex = (priorityTextField.inputView as? UIPickerView)?.selectedRow() ?? 0
        viewModel.selectPriority(at: selectedIndex)
    }
    
    private func makeCancelBarButton() -> UIBarButtonItem {
        
        return UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: nil)
    }
}
