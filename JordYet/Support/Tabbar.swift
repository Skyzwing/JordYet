//
//  Tabbar.swift
//  JordYet
//
//  Created by Surachat Yaitammasan on 12/9/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import SwiftUI

struct TabbarView: View {
    
    @State var selected = 0
    
    var body: some View {
        HStack {
            Button(action: {
                self.selected = 0
            }) {
                VStack {
                    Image(systemName: "house")
                    Text("Home")
                }.foregroundColor(self.selected == 0 ? .red : .black)
            }
            
            Spacer(minLength: 15)
            
            Button(action: {
                self.selected = 1
            }) {
                VStack {
                    Image(systemName: "photo")
                    Text("My Parking")
                }.foregroundColor(self.selected == 1 ? .red : .black)
            }
            
            Spacer(minLength: 15)
            
            Button(action: {
                self.selected = 2
            }) {
                VStack {
                    Image(systemName: "gear")
                    Text("Setting")
                }.foregroundColor(self.selected == 2 ? .red : .black)
            }
        }.padding([.leading, .trailing], 20)
        .padding(.vertical, 20).background(Color.white)
        
        .overlay(
            RoundedCornered(radius: 30.0, corners: [.topRight, .topLeft])
            .stroke(Color.white)
            .shadow(color: .secondary, radius: 5, x: 0, y: -4)
        )
    }
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}

struct RoundedCornered: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
            byRoundingCorners: corners, cornerRadii: CGSize(width:
            radius, height: radius))
        return Path(path.cgPath)
    }
}

extension TabbarView {
    func cornerRadiuss(_ radius: CGFloat, corners: UIRectCorner) -> some View {
       clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
