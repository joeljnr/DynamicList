//
//  ContentView.swift
//  DynamicList
//
//  Created by Joel Júnior on 31/12/19.
//  Copyright © 2019 jnr. All rights reserved.
//

import SwiftUI

struct User: Identifiable {
    var id: Int
    var username, message, imageName: String
    
}

struct ContentView: View {
    
    let users: [User] = [
        .init(id: 0, username: "Thom Yorke", message: "I'll do vocals, piano and guitars", imageName: "thom"),
        .init(id: 1, username: "Jonny Greenwood", message: "Lead guitar with some crazy effects", imageName: "jonny"),
        .init(id: 2, username: "Ed O'brien", message: "Base guitar and ambience", imageName: "ed"),
        .init(id: 3, username: "Colin Greenwood", message: "BASS", imageName: "colin"),
        .init(id: 4, username: "Phil Selway", message: "I play drums", imageName: "phil")
    ]
    
    var body: some View {
        NavigationView {
            List  {
                Text("Users").font(.largeTitle)
                ForEach (users) { user in
                    UserRow(user: user)
                }
            }.navigationBarTitle(Text("Dynamic List"))
        }
    }
}

struct UserRow: View {
    let user: User
    
    var body: some View {
        HStack {
            Image(user.imageName)
                .resizable()
                .frame(width: 70, height: 70)
                .clipped()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 4))
                
            VStack (alignment: .leading) {
                Text(user.username).font(.headline).lineLimit(nil)
                Text(user.message).font(.subheadline).lineLimit(nil)

            }.padding(.leading, 8)
        }.padding(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
