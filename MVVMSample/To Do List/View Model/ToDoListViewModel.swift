//
//  ToDoListViewModel.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 14.12.18.
//  Copyright © 2018 adesso mobile solutions GmbH. All rights reserved.
//

import Foundation

@objc protocol ToDoListViewModel {

    var toDoItems: [ToDoListItemViewModel] { get }
    var toDoItemsDidChange: ((ToDoListViewModel) -> Void)? { get set }

    func prepareView()

    func addToDoItem()
}
