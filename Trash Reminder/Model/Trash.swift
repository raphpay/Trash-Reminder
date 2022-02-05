//
//  Trash.swift
//  Trash Reminder
//
//  Created by Raphaël Payet on 05/02/2022.
//

import Foundation

struct Trash: Identifiable {
    let id = UUID()
    var reminders: [Reminder]
    var color: TrashColor
}
