//
//  ContentView.swift
//  TaskList
//
//  Created by MukhammadBobur Pakhriyev on 2020/07/26.
//  Copyright © 2020 MukhammadBobur Pakhriyev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var taskStore: TaskStore
    
    @State var modelPresent = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(taskStore.prioritizedTasks) {index in SectionView(prioritizedTasks: self.$taskStore.prioritizedTasks[index])}
            }
        .listStyle(GroupedListStyle())
            .navigationBarTitle("Tasks")
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                Button(action: { self.modelPresent = true})
                {
                    Image(systemName: "plus")
            })
        }
        .sheet(isPresented: $modelPresent) {
            TaskView(taskStore: self.taskStore)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(taskStore: TaskStore())
    }
}


