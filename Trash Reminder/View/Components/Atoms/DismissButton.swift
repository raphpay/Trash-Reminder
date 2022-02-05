//
//  DismissButton.swift
//  Trash Reminder
//
//  Created by Raphaël Payet on 05/02/2022.
//

import SwiftUI

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


struct DismissButton_Previews: PreviewProvider {
    static var previews: some View {
        DismissButton()
    }
}
