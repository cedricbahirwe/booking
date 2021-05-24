//
//  Menu.swift
//  Learn
//
//  Created by Cedric Bahirwe on 8/29/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI


struct TabBarButton: Hashable, Identifiable {
    let id = UUID()
    var isSelected: Bool
    var image: String
    var color: Color
    var bgColor: Color
}

struct Resource: Hashable, Identifiable {
    let id = UUID()
    var title: String
    var image: String
    var number: Int
    var getStarted: Bool
}

struct Menu: View {
    
    @State var hasImage = !false
    
    private let leftStackResources = [
        Resource(title: "Design system", image: "folder.circle.fill", number: 25, getStarted: false),
        Resource(title: "Podcasts", image: "" , number: 150, getStarted: false),
        Resource(title: "Gradient Tools", image: "archivebox.fill", number: 45, getStarted: true)
    ]
    
    private let rightStackResources = [
        Resource(title: "News", image: "" , number: 150, getStarted: false),
        Resource(title: "Design Books", image: "book.circle.fill", number: 260, getStarted: true),
        Resource(title: "Color tools", image: "book.fill", number: 32, getStarted: false)
    ]
    
    @State var tabBarButtons: [TabBarButton] = [TabBarButton(isSelected: true, image: "chart.bar.fill", color: .white, bgColor: Color(red: 0.427, green: 0.416, blue: 0.936)), TabBarButton(isSelected: false, image: "person.circle", color: .black, bgColor: .clear), TabBarButton(isSelected: false, image: "qrcode.viewfinder", color: .black, bgColor: .clear), TabBarButton(isSelected: false, image: "grid.circle", color: .black, bgColor: .clear)]
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                VStack(alignment: .leading) {
                    HStack {
                        HeaderButton(image: "list.bullet.indent", color: .black, bgColor: .clear)
                        Spacer()
                         HeaderButton(image: "bookmark", color: .black, bgColor: .clear)
                    }
                    VStack(alignment: .leading,spacing: 5) {
                        Text("Resources")
                            .bold()
                            .font(.largeTitle)
                            .foregroundColor(.black)
                        
            
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20,height: 20)
                                TextField("Search", text: .constant(""))
                                    .padding(.vertical, 10)
                            }
                            .padding(.leading)
                            .background(Color(.systemBackground))
                            .cornerRadius(30)
                    }
                }
                .padding()
                
                ScrollView {
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing:  10) {
                            ForEach(leftStackResources) { resource in
                                CardView(title: resource.title, image: resource.image, number: resource.number, getSarted: resource.getStarted)
                                    .frame(height: cardHeight(for: resource))
                            }
                        }
                        
                        Spacer()
                        VStack(alignment: .trailing, spacing: 10) {
                            ForEach(rightStackResources) { resource in
                                CardView(title: resource.title, image: resource.image, number: resource.number, getSarted: resource.getStarted)
                                    .frame(height: cardHeight(for: resource))
                            }
                        }
                        
                    }
                    .padding(10)
                }
                }
                ButtonViews(buttons: $tabBarButtons.animation())
                    .padding(.vertical, 5)
            }
            
        }
        .background(Color(red: 0.939, green: 0.95, blue: 0.945))
        .edgesIgnoringSafeArea(.all)
    }
    
    func cardHeight(for card: Resource) -> CGFloat {
        let defaultHeight = 100
        let firstMetric = card.image.isEmpty ? 0 : 80
        let secondMetric = card.getStarted ? 40 : 0
        return CGFloat(firstMetric + secondMetric + defaultHeight)
    }
}

struct Menu_Previews: PreviewProvider {
    @Environment(\.colorScheme) var colorScheme
    static var previews: some View {
        Menu()
//            .environment(\.colorScheme, .dark)
    }
}



struct CardView: View {
    
    let height: CGFloat = 100
    let title: String
    let image: String
    let number: Int
    let bgColor: Color = Color(red: 0.427, green: 0.416, blue: 0.936)
    let getSarted: Bool
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading) {
                Spacer()
                if !self.image.isEmpty{
                    Image(systemName: self.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 35)
                        .padding(.leading, 15 )
                    Spacer()
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(self.title)
                            .bold()
                        Spacer()
                    }
                    Text(self.number.description)
                    .bold()
                    .font(.largeTitle)
                }
                .padding(.leading, 15)
                
                Spacer()
                if self.getSarted {
                    Button(action: {}) {
                        Text("Get started")
                            .font(.system(size: 14, weight: .semibold))
                            .padding(.vertical, 10)
                             .frame(width: geo.size.width - 30)
                            .background(Color(red: 0.962, green: 0.819, blue: 0.559))
                            .foregroundColor(Color.black)

                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                    .padding(.leading, 15)
                    Spacer()
                }
            }
            .foregroundColor(Color(.label))
            .background(self.title == "News" ? self.bgColor : Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 25))
            
            
        }
    }
    
    var carHeight: CGFloat {
        let firstMetric = self.image.isEmpty ? 15 : 100
        let secondMetric = self.getSarted ? 55 : 15
        let defaultHeight = 60
        return CGFloat(firstMetric + secondMetric + defaultHeight)
    }
}

struct ButtonViews: View {
    
    @Binding var buttons: [TabBarButton]
    
    var body: some View {
        
        HStack {
        //                     Spacer()
            ForEach(self.buttons) { button in
                Spacer()
                Image(systemName: button.image)
                    .imageScale(.large)
                    .padding()
                    .background(button.bgColor)
                    .foregroundColor(button.color)
                    .cornerRadius(20)
                    .allowsHitTesting(true)
                    .transition(.asymmetric(insertion: .offset(x: -20, y: 0), removal: .slide))
                    .onTapGesture {
                        withAnimation(.spring()) {
                            for btn in self.buttons {
                                if btn.id == button.id {
                                    print("Salut")
                                    let index = self.buttons.firstIndex(of: btn)!
                                    self.buttons[index].bgColor = Color(red: 0.427, green: 0.416, blue: 0.936)
                                    self.buttons[index].color = .white
                                } else {
                                    let index = self.buttons.firstIndex(of: btn)!
                                    self.buttons[index].bgColor = .clear
                                    self.buttons[index].color = .black
                                }
                            }
                        }
                }
                Spacer()
            }
        }
    }
}
struct HeaderButton: View {
    let image: String
    let color: Color
    let bgColor: Color
    
    var body: some View {
        Button(action: {
            print("Button heeeit")
        }) {
            Image(systemName: image)
            .imageScale(.large)
            .padding()
            .background(bgColor)
            .foregroundColor(color)
            .cornerRadius(20)
        }
    }
}
