//
//  Reminder.swift
//  Trash Reminder
//
//  Created by Raphaël Payet on 05/02/2022.
//

import Foundation

struct Reminder: Identifiable {
    let id = UUID()
    var color: TrashColor
    var collectDay: String
}
