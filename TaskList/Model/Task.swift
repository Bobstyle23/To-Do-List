//
//  Task.swift
//  TaskList
//
//  Created by MukhammadBobur Pakhriyev on 2020/07/26.
//  Copyright © 2020 MukhammadBobur Pakhriyev. All rights reserved.
//
import Foundation

struct Task: Identifiable {
    let id = UUID()
    
    var name: String
    var completed = false
}
