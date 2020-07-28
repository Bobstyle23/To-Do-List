//
//  TaskStore.PrioritizedTasks.swift
//  TaskList
//
//  Created by MukhammadBobur Pakhriyev on 2020/07/27.
//  Copyright © 2020 MukhammadBobur Pakhriyev. All rights reserved.
//

extension TaskStore {
    struct PrioritizedTasks {
        let priority: Task.Priority
        var tasks: [Task]
    }
}

extension TaskStore.PrioritizedTasks: Identifiable {
    var id: Task.Priority { priority }
}


