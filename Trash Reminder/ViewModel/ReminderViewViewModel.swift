//
//  ReminderViewViewModel.swift
//  Trash Reminder
//
//  Created by Raphaël Payet on 07/06/2022.
//

import Foundation

final class ReminderViewViewModel: ObservableObject {
    @Published var trashSelection: Int = 0
    @Published var daySelection: Int = 0
    let weekDays = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"]
    
    func addReminder() {
        let trashKey = trashSelection == TrashColor.gray.number ? GRAY_TRASH_DAYS_KEY : YELLOW_TRASH_DAYS_KEY
        let storage = UserDefaults.standard
        
        if var array = storage.array(forKey: trashKey) as? [Int],
            !array.isEmpty {
                if !array.contains(where: { $0 == daySelection}) {
                    array.append(daySelection)
                    storage.set(array, forKey: trashKey)
                }
        } else {
            storage.set([daySelection], forKey: trashKey)
        }
    }

}
