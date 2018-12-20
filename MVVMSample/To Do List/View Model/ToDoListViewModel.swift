//
//  ToDoListViewModel.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 14.12.18.
//  Copyright © 2018 adesso mobile solutions GmbH. All rights reserved.
//

import Foundation
import Bond

protocol ToDoListViewModel {

    var toDoItems: MutableObservableArray<ToDoListItemViewModel> { get }
    
    func prepareView()

    func addToDoItem()
}
