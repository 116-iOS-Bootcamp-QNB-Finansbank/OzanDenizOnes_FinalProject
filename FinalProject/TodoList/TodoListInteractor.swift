//
//  TodoListInteractor.swift
//  FinalProject
//
//  Created by Ozan Deniz Ones on 9.10.2021.
//

import Foundation

class TodoListInteractor: NSObject, TodoListInteractorProtocol {
    
    weak var delegate: TodoListInteractorDelegate?
    private let service: CoreDataFunctionalService
    private var todoItems: [TodoItem] = []
    
    init(service: CoreDataFunctionalService) {
        self.service = service
    }
    
    func saveTodo(_todo: TodoListPresentation) {
           service.save(_todo: _todo)
    }
    
    func viewDidLoad() {
        fetchFromCoreData()
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        //TODO
    }
        
    func fetchFromCoreData() {
        do {
            self.todoItems = try service.context.fetch(TodoItem.fetchRequest())
            self.delegate?.handleOutput(_output: .showTodoList(self.todoItems))
            
        } catch  {
            print("Error occured while fetching TodoItems from Core Data")
        }
    }
    
    
}
