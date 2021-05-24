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
                Image("logo")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, minHeight: 200, maxHeight: geo.size.height / 1.8)
                    .clipped()
                    .ignoresSafeArea(.all, edges: .top)

                    
                
                VStack(alignment: .leading) {
                    Group {
                        Text("Learn")
                            .font(.system(size: 65, weight: .bold, design: .rounded))
                        
                        
                        Text("The beautiful thing about learning is that nobody can take it away from you.")
                            .font(.system(size: 22, weight: .regular, design: .default))
                    }
                    .padding(.vertical, 5)
                    
                    HStack {
                        Button(action: {
                            
                        }) {
                            Text("Get started")
                                .padding(.horizontal, 50)
                                .padding(.vertical, 12)
                                .background(Color.primary)
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .foregroundColor(Color(.systemBackground))
                                .cornerRadius(30)
                        }
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Image(systemName: "play.rectangle.fill")
                                .resizable()
                                .imageScale(.large)
                                .frame(width: 35, height: 25)
                                .foregroundColor(Color.red)
                        }
                    }
                }
                .padding(.horizontal, 20)
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
