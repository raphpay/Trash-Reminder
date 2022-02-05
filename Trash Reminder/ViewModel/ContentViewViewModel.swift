//
//  ContentViewViewModel.swift
//  Trash Reminder
//
//  Created by Raphaël Payet on 05/02/2022.
//

import Foundation

final class ContentViewViewModel: ObservableObject {
    @Published var showAlert = false
    @Published var trashSelection = 0
    @Published var daySelection = 0
}
