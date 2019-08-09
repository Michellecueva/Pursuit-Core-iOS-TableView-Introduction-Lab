//
//  Data.swift
//  TableViewIntroductionLab
//
//  Created by Michelle Cueva on 8/8/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

 var allTasks: [Task] {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en")
    dateFormatter.dateFormat = "MM-dd-yyyy"
    return [
        Task(name: "Create project roadmap",
             status: .inProgress,
             dueDate: dateFormatter.date(from: "08-13-2020")!),
        Task(name: "Source information session speakers",
             status: .notStarted,
             dueDate: dateFormatter.date(from: "09-22-2020")!),
        Task(name: "Secure event funding",
             status: .completed,
             dueDate: dateFormatter.date(from: "09-28-2020")!),
        Task(name: "Secure venue for keynote",
             status: .completed,
             dueDate: dateFormatter.date(from: "10-23-2020")!),
        Task(name: "Identify event KPIs",
             status: .inProgress,
             dueDate: dateFormatter.date(from: "7-04-2020")!),
        Task(name: "Create internal newsletter advertising event",
             status: .notStarted,
             dueDate: dateFormatter.date(from: "6-09-2020")!),
        Task(name: "Submit food budget",
             status: .completed,
             dueDate: dateFormatter.date(from: "6-12-2020")!),
        Task(name: "Create event logo",
             status: .notStarted,
             dueDate: dateFormatter.date(from: "5-02-2020")!),
        Task(name: "Make companion iOS application for event",
             status: .inProgress,
             dueDate: dateFormatter.date(from: "11-14-2020")!),
        Task(name: "Get celebrity speaker (Tim Cook?)",
             status: .inProgress,
             dueDate: dateFormatter.date(from: "8-16-2020")!),
        Task(name: "Purchase event insurance",
             status: .completed,
             dueDate: dateFormatter.date(from: "5-19-2020")!),
        Task(name: "Get event SWAG",
             status: .completed,
             dueDate: dateFormatter.date(from: "8-20-2020")!),
        Task(name: "Secure seat with SpaceX",
             status: .notStarted,
             dueDate: dateFormatter.date(from: "11-13-2020")!),
        Task(name: "Conduct brainstorming session",
             status: .completed,
             dueDate: dateFormatter.date(from: "10-03-2020")!),
        Task(name: "Get all necessary headcount allocated",
             status: .completed,
             dueDate: dateFormatter.date(from: "04-13-2020")!),
    ]
}

func completedInfo() -> [(String, Date)] {
    var Arr: [(name: String, date: Date)] = []
    for each in allTasks where each.status == .completed {
        Arr.append((each.name, each.dueDate))
    }
    return Arr
}

func notStartedInfo() -> [(String, Date)] {
    var Arr: [(name: String, date: Date)] = []
    for each in allTasks where each.status == .notStarted {
        Arr.append((each.name, each.dueDate))
    }
    return Arr
}

func inProgressInfo() -> [(String, Date)] {
    var Arr: [(name: String, date: Date)] = []
    for each in allTasks where each.status == .inProgress {
        Arr.append((each.name, each.dueDate))
    }
    return Arr
}

func sort(isAscending: Bool, array:[(String, Date)]) -> [(String, Date)] {
    return isAscending ? array.sorted{$0.1 < $1.1} : array.sorted{$0.1 > $1.1}
}

