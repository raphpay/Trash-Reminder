//
//  Reminder.swift
//  Trash Reminder
//
//  Created by Raphaël Payet on 05/02/2022.
//

import Foundation

enum TrashColor {
    case gray, yellow
}

struct Reminder: Identifiable {
    let id = UUID()
    var trashColor: TrashColor
    var collectDays: [Date]
}
