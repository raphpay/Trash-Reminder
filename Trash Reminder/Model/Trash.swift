//
//  Trash.swift
//  Trash Reminder
//
//  Created by Raphaël Payet on 05/02/2022.
//

import Foundation

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
}

struct Trash: Identifiable {
    let id = UUID()
    var reminders: [Reminder]
    var color: TrashColor
}
