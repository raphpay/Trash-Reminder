//
//  Array+Ext.swift
//  Trash Reminder
//
//  Created by Raphaël Payet on 09/06/2022.
//

import Foundation
import UIKit

class Storage: NSObject {
    static func archiveIntArray(object: [Int]) -> Data {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: object, requiringSecureCoding: false)
            return data
        } catch {
            fatalError("loadWStringArray - Can't encode data: \(error)")
        }
    }
    
    static func loadIntArray(data: Data) -> [Int] {
        do {
            guard let array = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Int] else {
                return []
            }
            return array
        } catch {
            fatalError("loadIntArray - Can't encode data: \(error)")
        }
    }
    

    
    static func convertIntToDays(fromArray array: [Int]) -> [String] {
        let weekDays = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"]
        var reminders: [String] = []
        
        for intDay in array {
            let day = weekDays[intDay]
            reminders.append(day)
        }
        
        return reminders
    }
}

extension Data {
    func getPickUpDays() -> [String] {
        let intArray = Storage.loadIntArray(data: self)
        let days = Storage.convertIntToDays(fromArray: intArray)
        return days
    }
}
