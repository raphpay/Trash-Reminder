//
//  TrashImage.swift
//  Trash Reminder
//
//  Created by Raphaël Payet on 05/02/2022.
//

import SwiftUI

struct TrashImage: View {
    
    let image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: 130, height: 150)
            .aspectRatio(contentMode: .fill)
    }
}
struct TrashImage_Previews: PreviewProvider {
    static var previews: some View {
        TrashImage(image: Assets.grayTrash)
    }
}
