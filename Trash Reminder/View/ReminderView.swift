//
//  ReminderView.swift
//  Trash Reminder
//
//  Created by Raphaël Payet on 05/02/2022.
//

import SwiftUI

struct ReminderView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 50, height: 50)
            .background(Color.blue)
    }
}

struct ReminderView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderView()
    }
}
