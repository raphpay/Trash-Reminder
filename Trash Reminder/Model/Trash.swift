//
//  Trash.swift
//  Trash Reminder
//
//  Created by Raphaël Payet on 05/02/2022.
//

import Foundation

let GRAY_TRASH_DAYS_KEY = "GRAY_TRASH_DAYS_KEY"
let YELLOW_TRASH_DAYS_KEY = "YELLOW_TRASH_DAYS_KEY"

enum TrashColor: String {
    case yellow, gray
    
    var translation: String {
        switch self {
        case .yellow:
            return "Jaune"
        case .gray:
            return "Grise"
        }
    }
    
    var userDefaultsKey: String {
        switch self {
        case .yellow:
            return GRAY_TRASH_DAYS_KEY
        case .gray:
            return YELLOW_TRASH_DAYS_KEY
        }
    }
}

struct Trash: Identifiable {
    let id = UUID()
    var reminders: [Reminder]
    var color: TrashColor
}
