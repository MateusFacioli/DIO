//
//  Task.swift
//  DIO-MAPS-TASKS
//
//  Created by Mateus Rodrigues on 21/11/22.
//

import Foundation

struct Task {
    var id = UUID()
    var name: String = ""
    var date: Date = Date()
    var category: Category = Category(name: "Marketing", color: .black)
    
}
