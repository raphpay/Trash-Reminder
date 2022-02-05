//
//  ContentView.swift
//  Trash Reminder
//
//  Created by Raphaël Payet on 05/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    let screen = UIScreen.main.bounds
    
    private var yellowReminders: [Reminder] = []
    private var grayReminders: [Reminder] = []
    @State private var showAlert = false
    @State private var trashSelection = 0
    @State private var daySelection = 0
    private var yellowTrash = Trash(reminders: [], color: .yellow)
    private var grayTrash = Trash(reminders: [], color: .gray)
    
    var body: some View {
        ZStack {
            home
            ReminderView(showAlert: $showAlert, trashSelection: $trashSelection, daySelection: $daySelection)
            .opacity(showAlert ? 1 : 0)
        }
        .background(Color.ui.gray)
    }
    
    var home: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(height: screen.height / 2 - 50)
                    .foregroundColor(.ui.gray)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Trash Reminder")
                        .font(.custom(Font.texturina.rawValue, size: 40))
                        .foregroundColor(.white)
                        .padding(.top, 30)
                    TrashView(trash: yellowTrash)
                    Spacer()
                }
            }
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: screen.height / 2 + 50)
                    .foregroundColor(.ui.yellow)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    TrashView(trash: grayTrash)
                    
                    Spacer()
                    Button {
                        showAlert.toggle()
                    } label: {
                        Label("Ajouter un rappel", systemImage: "timer")
                            .font(.system(size: 20))
                            .foregroundColor(.blue)
                            .padding(.bottom, 30)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
