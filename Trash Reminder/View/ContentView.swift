//
//  ContentView.swift
//  Trash Reminder
//
//  Created by Raphaël Payet on 05/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
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
                            Text("Mardi Matin")
                                .font(.custom(Font.texturina.rawValue, size: 25))
                                .foregroundColor(.white)
                            
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
                            Text("Lundi Matin")
                                .font(.custom(Font.texturina.rawValue, size: 25))
                                .foregroundColor(.white)
                            Text("Vendredi Matin")
                                .font(.custom(Font.texturina.rawValue, size: 25))
                                .foregroundColor(.white)
                            
                        }
                        .padding(.horizontal)
                        .padding(.top)
                    }
                    
                    Spacer()
                    Button {
                        //
                    } label: {
                        Label("Ajouter un rappel", systemImage: "timer")
                            .font(.system(size: 20))
                            .foregroundColor(.blue)
                            .padding(.bottom, 30)
                    }

                }
            }
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
