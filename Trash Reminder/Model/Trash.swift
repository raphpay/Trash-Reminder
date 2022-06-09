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
    case gray, yellow
    
    var translation: String {
        switch self {
        case .gray:
            return "Grise"
        case .yellow:
            return "Jaune"
        }
    }
    
    var userDefaultsKey: String {
        switch self {
        case .gray:
            return YELLOW_TRASH_DAYS_KEY
        case .yellow:
            return GRAY_TRASH_DAYS_KEY
        }
    }
    
    var number: Int {
        switch self {
        case .gray:
            return 0
        case .yellow:
            return 1
        }
    }
}

struct Trash: Identifiable {
    let id = UUID()
    var reminders: [Reminder]
    var color: TrashColor
}
