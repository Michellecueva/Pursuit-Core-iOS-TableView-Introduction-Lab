import Foundation

struct Task {
    enum Status: String {
        case notStarted = "Not Started"
        case inProgress = "In Progress"
        case completed = "Completed"
    }
    
    let name: String
    let status: Status
    let dueDate: Date
    
   
}
