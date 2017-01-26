import Foundation

struct AuthenticateTableModel {
    
    enum Section {
        case content
    }
    
    enum Cell {
        case one
        case two
        case three
        case four
        case five
        case other
        var text: String {
            switch self {
            case .one: return "Show matchmaker"
            case .two: return "Login"
            case .three: return "Show players"
            case .four: return "Show match"
            case .five: return "Show game"
            case .other: return "Other"
            default: return "None determine"
            }
        }
    }
    
    let sections: [Section] = [.content]
    let cells: [Cell]
    
    init() {
        cells = [Cell.one, Cell.two, Cell.three, Cell.four, Cell.five]
    }
}
