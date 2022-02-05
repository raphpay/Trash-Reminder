//
//  ContentView.swift
//  Trash Reminder
//
//  Created by Raphaël Payet on 05/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    let screen = UIScreen.main.bounds
    @ObservedObject private var viewModel = ContentViewViewModel()
    
    var body: some View {
        ZStack {
            home
            ReminderView(showAlert: $viewModel.showAlert, trashSelection: $viewModel.trashSelection, daySelection: $viewModel.daySelection)
                .opacity(viewModel.showAlert ? 1 : 0)
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
                    TrashView(trash: viewModel.yellowTrash)
                    Spacer()
                }
            }
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: screen.height / 2 + 50)
                    .foregroundColor(.ui.yellow)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    TrashView(trash: viewModel.grayTrash)
                    
                    Spacer()
                    Button {
                        viewModel.showAlert.toggle()
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
