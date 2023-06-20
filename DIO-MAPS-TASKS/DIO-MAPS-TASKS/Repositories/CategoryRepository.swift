//
//  CategoryRepository.swift
//  DIO-MAPS-TASKS
//
//  Created by Mateus Rodrigues on 23/05/23.
//

import Foundation
import UIKit // só por causa da cor mas em tese essa classe é distante de telas e seus componentes

class CategoryRepository {
    
    static func getCategories() -> [Category] {
      let categories = [
        Category(name: "Work", color: .green),
        Category(name: "Study", color: .blue),
        Category(name: "To dos", color: .yellow),
        Category(name: "Shopping list", color: .black),
        Category(name: "Reminders", color: .red)
      ]
        return categories
    }
}
