//
//  TaskModel.swift
//  lection_ tableView_1.07
//
//  Created by Роман Родителев on 7/1/19.
//  Copyright © 2019 Роман Родителев. All rights reserved.
//

import Foundation
import UIKit

class Task: Codable {
    var title: String
    var description: String
    var id: String
    var isActive: Bool
    var image: Data
    var date: Date
    var adress: String

    
    init(title: String, description: String, isActive: Bool, image: Data, date: Date, adress: String) {
        self.title = title
        self.description = description
        self.id = UUID().uuidString
        self.isActive = isActive
        self.image = image
        self.date = date
        self.adress = adress
    }
}

//MARK: - User Defaults -
extension Task {
    static let userDefaultsKey = "Tasks Key"
    static func save(_ tasks:[Task]) {
        let data = try? JSONEncoder().encode(tasks)
        UserDefaults.standard.set(data, forKey: Task.userDefaultsKey)
    }
    
    static func loadTask() -> [Task] {
        var returnValue: [Task] = []
        if let data = UserDefaults.standard.data(forKey: Task.userDefaultsKey), let tasks = try? JSONDecoder().decode([Task].self, from: data) {
            returnValue = tasks
        }
        return returnValue
    }
    
}
