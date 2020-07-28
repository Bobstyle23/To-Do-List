//
//  TaskView.swift
//  TaskList
//
//  Created by MukhammadBobur Pakhriyev on 2020/07/26.
//  Copyright © 2020 MukhammadBobur Pakhriyev. All rights reserved.
//

import SwiftUI

struct TaskView: View {
    
    var taskStore: TaskStore
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var text = ""
    @State var priority: Task.Priority = .no
    
    
    var body: some View {
        
        Form {
            TextField("Task Name", text: $text)
            VStack {
                Text("Priority")
                Picker("Priority", selection: $priority.caseIndex) {
                    ForEach(Task.Priority.allCases.indices) {
                        priorityIndex in
                        Text(
                            Task.Priority.allCases[priorityIndex].rawValue.capitalized
                        )
                        .tag(priorityIndex)
                    }
                }
            .pickerStyle(SegmentedPickerStyle())
            }
            Button(action: {
                let priorityIndex = self.taskStore.getIndex(for: self.priority)
                self.taskStore.prioritizedTasks[priorityIndex].tasks.append(Task(name: self.text))
                
                 self.presentationMode.wrappedValue.dismiss()
            })
               {
                Text("Add")
            }.disabled(text.isEmpty)

        }
    }
}


struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(taskStore: TaskStore())
    }
}
