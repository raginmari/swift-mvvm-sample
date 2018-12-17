//
//  SimplePickerView.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 17.12.18.
//  Copyright © 2018 adesso mobile solutions GmbH. All rights reserved.
//

import UIKit

final class SimplePickerView: UIPickerView, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var items: [String] = []
    
    init(frame: CGRect, items: [String]) {
        
        super.init(frame: frame)
        self.items = items
        dataSource = self
        delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return items.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return items[row]
    }
}

extension UIPickerView {
    
    func selectedRow() -> Int {
        
        return selectedRow(inComponent: 0)
    }
}
