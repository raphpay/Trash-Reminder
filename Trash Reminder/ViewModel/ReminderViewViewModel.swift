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
        // TODO: This key is not needed
        let trashKey = trashSelection == TrashColor.gray.number ? GRAY_TRASH_DAYS_KEY : YELLOW_TRASH_DAYS_KEY
        let dataTrashKey = trashSelection == TrashColor.gray.number ? DATA_GRAY_TRASH_DAYS_KEY : DATA_YELLOW_TRASH_DAYS_KEY
        
        // TODO: Refactor
        if var array = UserDefaults.standard.array(forKey: trashKey) as? [Int],
            !array.isEmpty {
                if !array.contains(where: { $0 == daySelection}) {
                    array.append(daySelection)
                    UserDefaults.standard.set(array as [Int], forKey: trashKey)
                    let arrayData = Storage.archiveIntArray(object: array)
                    UserDefaults.standard.set(arrayData, forKey: dataTrashKey)
                }
        } else {
            UserDefaults.standard.set([daySelection], forKey: trashKey)
            let arrayData = Storage.archiveIntArray(object: [daySelection])
            UserDefaults.standard.set(arrayData, forKey: dataTrashKey)
        }
    }

}
