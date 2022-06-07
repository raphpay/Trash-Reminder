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
        // TODO: To be refactored
        // TODO: Remove print statements
        switch trashSelection {
        case 0:
            if var array = UserDefaults.standard.array(forKey: GRAY_TRASH_DAYS_KEY) as? [Int] {
                print("Gray already created", array.contains(where: { $0 == daySelection }))
                if array.contains(where: { $0 == daySelection }) {
                    print("Gray contains the day ==> Error")
                } else {
                    array.append(daySelection)
                    UserDefaults.standard.set(array, forKey: GRAY_TRASH_DAYS_KEY)
                    print("Gray don't contains the day. New array =", array)
                }
            } else {
                UserDefaults.standard.set([daySelection], forKey: GRAY_TRASH_DAYS_KEY)
                print("Gray not created")
            }
            break
        case 1:
            if var array = UserDefaults.standard.array(forKey: YELLOW_TRASH_DAYS_KEY) as? [Int] {
                print("Yellow already created", array)
                if array.contains(where: { $0 == daySelection }) {
                    print("Yellow contains the day ==> Error")
                } else {
                    array.append(daySelection)
                    UserDefaults.standard.set(array, forKey: YELLOW_TRASH_DAYS_KEY)
                    print("Yellow don't contains the day. New array =", array)
                }
            } else {
                UserDefaults.standard.set([daySelection], forKey: YELLOW_TRASH_DAYS_KEY)
                print("Yellow already created")
            }
            break
        default:
            break
        }
    }

}
