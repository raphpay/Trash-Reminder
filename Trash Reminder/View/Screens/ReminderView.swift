//
//  ReminderView.swift
//  Trash Reminder
//
//  Created by Raphaël Payet on 05/02/2022.
//

import SwiftUI

struct ReminderView: View {
    
    @Binding var showAlert: Bool
    @Binding var trashSelection: Int
    @Binding var daySelection: Int
    private let weekDays = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"]
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
                .opacity(showAlert ? 0.4 : 0)
                .animation(.spring(), value: showAlert)
                .onTapGesture {
                    withAnimation {
                        showAlert.toggle()
                    }
                }
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                    .frame(width: 250, height: 250)
                    .overlay {
                        Button {
                            withAnimation {
                                showAlert.toggle()
                            }
                        } label: {
                            DismissButton()
                        }

                    }
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
                        ForEach(0..<weekDays.count, id: \.self) { day in
                            Text("\(weekDays[day]) Matin").tag(day)
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
            }
            .offset(y: showAlert ? 0 : 1000)
            .animation(.spring(), value: showAlert)
        }
    }
}

struct ReminderView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderView(showAlert: .constant(true), trashSelection: .constant(0), daySelection: .constant(0))
    }
}
