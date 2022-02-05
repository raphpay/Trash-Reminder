//
//  Reminder.swift
//  Trash Reminder
//
//  Created by Raphaël Payet on 05/02/2022.
//

import Foundation

enum TrashColor {
    case gray, yellow
    
    var translation: String {
        switch self {
        case .gray:
             return "Grise"
        case .yellow:
            return "Jaune"
        }
    }
}

struct Reminder: Identifiable {
    let id = UUID()
    var trashColor: TrashColor
    var collectDay: String
}
