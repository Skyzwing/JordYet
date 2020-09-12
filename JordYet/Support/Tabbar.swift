//
//  Tabbar.swift
//  JordYet
//
//  Created by Surachat Yaitammasan on 12/9/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import SwiftUI

struct Tabbar: View {
    var body: some View {
        HStack {
            Button(action: {
                
            }) {
                VStack {
                    Image(systemName: "house")
                    Text("Home")
                }.foregroundColor(.black)
            }
            
            Spacer(minLength: 15)
            
            Button(action: {
                
            }) {
                VStack {
                    Image(systemName: "photo")
                    Text("My Parking")
                }.foregroundColor(.black)
            }
            
            Spacer(minLength: 15)
            
            Button(action: {
                
            }) {
                VStack {
                    Image(systemName: "gear")
                    Text("Setting")
                }.foregroundColor(.black)
            }
        }.padding([.leading, .trailing], 20)
        .padding(.vertical, 20).background(Color.white)
        
        .overlay(
            RoundedCorner(radius: 30.0, corners: [.topRight, .topLeft])
            .stroke(Color.white)
            .shadow(color: .secondary, radius: 5, x: 0, y: -4)
        )
    }
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
            byRoundingCorners: corners, cornerRadii: CGSize(width:
            radius, height: radius))
        return Path(path.cgPath)
    }
}

extension Tabbar {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
       clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
