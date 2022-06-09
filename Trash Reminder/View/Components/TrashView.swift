//
//  TrashView.swift
//  Trash Reminder
//
//  Created by Raphaël Payet on 05/02/2022.
//

import SwiftUI

struct TrashView: View {
    
    var trash: Trash
    var days: Data
    
    var body: some View {
        HStack(alignment: .top) {
            
            if trash.color == .gray {
                TrashImage(image: Assets.grayTrash)
                Spacer()
            }
            
            VStack(alignment: trash.color == .yellow ? .leading : .trailing) {
                Text("Poubelle \(trash.color.translation)")
                    .font(.custom(Font.texturina.rawValue, size: 20))
                    .foregroundColor(trash.color == .yellow ? .ui.yellow : .ui.gray)
                Text("Ramassage")
                    .font(.custom(Font.texturina.rawValue, size: 15))
                    .foregroundColor(.ui.secondary)
                ForEach(days.getPickUpDays(), id: \.self) { reminder in
                    Text(reminder)
                        .font(.custom(Font.texturina.rawValue, size: 25))
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            
            if trash.color == .yellow {
                Spacer()
                TrashImage(image: Assets.yellowTrash)
            }
        }
        .onAppear {
            print("TrashView", trash.reminders.isEmpty)
        }
    }
}

struct TrashView_Previews: PreviewProvider {
    static var previews: some View {
        TrashView(trash: Trash(reminders: [], color: .yellow), days: Data())
    }
}
