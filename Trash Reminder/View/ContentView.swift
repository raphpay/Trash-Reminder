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
    private let weekDays = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"]
    @State private var showAlert = true
    @State private var trashSelection = 0
    @State private var daySelection = 0
    
    var body: some View {
        ZStack {
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
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text("Poubelle jaune")
                                    .font(.custom(Font.texturina.rawValue, size: 20))
                                    .foregroundColor(.ui.yellow)
                                Text("Ramassage")
                                    .font(.custom(Font.texturina.rawValue, size: 15))
                                    .foregroundColor(.ui.secondary)
                                ForEach(yellowReminders, id: \.id) { reminder in
                                    Text(reminder.collectDay)
                                        .font(.custom(Font.texturina.rawValue, size: 25))
                                        .foregroundColor(.white)
                                }
                            }
                            .padding(.horizontal)
                            
                            Spacer()
                            
                            TrashImage(image: Assets.yellowTrash)
                        }
                        Spacer()
                    }
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: screen.height / 2 + 50)
                        .foregroundColor(.ui.yellow)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        
                        HStack(alignment: .top) {
                            TrashImage(image: Assets.grayTrash)
                            
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                Text("Poubelle grise")
                                    .font(.custom(Font.texturina.rawValue, size: 20))
                                    .foregroundColor(.ui.gray)
                                Text("Ramassage")
                                    .font(.custom(Font.texturina.rawValue, size: 15))
                                    .foregroundColor(.ui.secondary)
                                ForEach(grayReminders, id: \.id) { reminder in
                                    Text(reminder.collectDay)
                                        .font(.custom(Font.texturina.rawValue, size: 25))
                                        .foregroundColor(.white)
                                }
                            }
                            .padding(.horizontal)
                            .padding(.top)
                        }
                        
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
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                    .opacity(showAlert ? 0.4 : 0)
                    .animation(.spring(), value: showAlert)
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                        .frame(width: 250, height: 250)
                    VStack(alignment: .leading) {
                        Text("Poubelle")
                            .font(.custom(Font.texturina.rawValue, size: 20))
                        Picker("Quelle est la couleur de la poubelle ?", selection: $trashSelection, content: {
                            // TODO: Find a way to set this text to white when selected
                            Text("Grise").tag(0)
                            Text("Jaune").tag(1)
                        })
                            .pickerStyle(.segmented)
                            .colorMultiply(trashSelection == 0 ? .ui.gray : .ui.yellow)
                            .animation(.easeIn, value: trashSelection)
                        
                        Text("Date")
                            .font(.custom(Font.texturina.rawValue, size: 20))
                        Picker("Quelle est la date de ramassage ?",selection: $daySelection) {
                            ForEach(weekDays, id: \.self) { day in
                                Text("\(day) Matin")
                            }
                        }
                        .pickerStyle(.automatic)
                        
                        Button {
                            //
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .foregroundColor(.ui.yellow)
                                Text("Ajouter")
                                    .foregroundColor(.ui.gray)
                            }
                        }

                    }
                    .padding()
                    .frame(width: 250, height: 250)
                    .overlay {
                        Button {
                            showAlert.toggle()
                        } label: {
                            DismissButton()
                        }

                    }
                }
                .offset(y: showAlert ? 0 : 1000)
                .animation(.spring(), value: showAlert)
            }
            .opacity(showAlert ? 1 : 0)
        }
        .background(Color.ui.gray)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct TrashImage: View {
    
    let image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: 130, height: 150)
            .aspectRatio(contentMode: .fill)
    }
}


struct DismissButton: View {
    var body: some View {
        HStack {
            Spacer()
            VStack {
                ZStack {
                    Circle()
                        .foregroundColor(.ui.gray)
                        .frame(width: 30, height: 30)
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                }
                Spacer()
            }
            .padding(.trailing, 4)
            .padding(.top, 4)
        }
    }
}
