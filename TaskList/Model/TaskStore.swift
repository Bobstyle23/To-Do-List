//
//  TaskStore.swift
//  TaskList
//
//  Created by MukhammadBobur Pakhriyev on 2020/07/26.
//  Copyright © 2020 MukhammadBobur Pakhriyev. All rights reserved.
//

import Combine

class TaskStore: ObservableObject {
   
    @Published var prioritizedTasks = [
        PrioritizedTasks(priority: .high,
         names:  [
            "Prepare a meal",
            "Go to the gym",
            "Do some coding practice",
        ]),
        PrioritizedTasks(priority: .medium, names: [
            "Walk with dog",
            "Clean the house",
            "Buy a gift",
        ]),
        PrioritizedTasks(priority: .low, names: [
            "Clean the car after the gym",
            "Meet friends"
        ]),
        PrioritizedTasks(priority: .no, names: [
            "Make a protein shake",
            "Drink 2L water daily"
        ])
    ]
    func getIndex(for priority: Task.Priority) -> Int {
        prioritizedTasks.firstIndex {$0.priority == priority}!
    }
}
private extension TaskStore.PrioritizedTasks {
    init(priority: Task.Priority, names: [String]) {
        self.init(priority: priority, tasks: names.map { Task(name: $0)})
    }
}
