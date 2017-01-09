import Foundation

struct AuthenticateTableModel {
    
    enum Section {
        case content
    }
    
    enum Cell {
        case one
        case two
        case three
        case other
        var text: String {
            switch self {
            case .one: return "One"
            case .other: return "Other"
            default: return "None determine"
            }
        }
    }
    
    let sections: [Section] = [.content]
    let cells: [Cell]
    
    init() {
        cells = [Cell.one, Cell.other, Cell.other]
    }
}
