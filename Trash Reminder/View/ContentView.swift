//
//  ContentView.swift
//  Trash Reminder
//
//  Created by Raphaël Payet on 05/02/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Trash Reminder")
                .font(.custom(Font.texturina.rawValue, size: 30))
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
