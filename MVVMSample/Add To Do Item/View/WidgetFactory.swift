//
//  WidgetFactory.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 17.12.18.
//  Copyright © 2018 adesso mobile solutions GmbH. All rights reserved.
//

import UIKit

final class WidgetFactory {
    
    static func makeDateAndTimePicker(minimumDate: Date) -> UIDatePicker {
        
        let picker = UIDatePicker()
        picker.datePickerMode = .dateAndTime
        picker.minimumDate = minimumDate
        picker.maximumDate = nil
        
        return picker
    }
    
    static func makePicker(items: [String]) -> UIPickerView {
        
        return SimplePickerView(frame: CGRect.zero, items: items)
    }
    
    static func makeToolbar(buttonTitle: String, target: Any, action: Selector) -> UIToolbar {
        
        let doneButton = UIBarButtonItem(title: buttonTitle, style: .plain, target: target, action: action)
        
        let toolbar = UIToolbar()
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([ spacer, doneButton ], animated: false)
        
        return toolbar
    }
}
