//
//  ContentView.swift
//  Learn
//
//  Created by Cedric Bahirwe on 8/29/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading) {
    //            Text("Hello, World!")
                Image("logo")
                .resizable()
                    .frame(minWidth: 0, idealWidth: geo.size.width, maxWidth: geo.size.width, minHeight: 200, idealHeight: geo.size.height / 1.8, maxHeight: geo.size.height / 1.8)
                
                
                Text("Learn")
                    .font(.system(size: 65, weight: .bold, design: .rounded))
                    .padding(.leading, 50)
                    .foregroundColor(Color.black)
                
                
                Text("The beautiful thing about learning is that nobody can take it away from you.")
                    .font(.system(size: 22, weight: .regular, design: .default))
                    .padding(.horizontal, 35)
                    .padding()
                    .foregroundColor(Color.black)
                
                HStack {
                    Button(action: {
                    
                    }) {
                        Text("Get started")
                            .padding()
                            .padding(.horizontal, 50)
                            .padding(.vertical, 5)
                            .background(Color(red: 0.022, green: 0.022, blue: 0.022))
                            .font(.system(size: 20, weight: .semibold, design: .default))
                            .foregroundColor(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                    
                    Spacer()
                        .frame(width: 40)
                    
                    Button(action: {}) {
                        Image(systemName: "play.rectangle.fill")
                            .resizable()
                            .imageScale(.large)
                            .frame(width: 35, height: 25)
                            .foregroundColor(Color.purple)
                    }
                }
                .frame(width: geo.size.width)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .dark)
    }
}
