//
//  Tabbar.swift
//  JordYet
//
//  Created by Surachat Yaitammasan on 12/9/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import SwiftUI

struct TabbarParkDetail: View {
    
    @Environment(\.viewController) private var viewControllerHolder: ViewControllerHolder
    private var viewController: UIViewController? {
        self.viewControllerHolder.value
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("12:00")
                    .font(kanitBold).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color.white)
                    .frame(width: 156, height: 48)
                    .cornerRadius(12)
                    .shadow(color: backButtonShadow, radius: 12, x: 0, y: 4).padding(.trailing, 4)
                Text("14:00")
                    .font(kanitBold).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color.white)
                    .frame(width: 156, height: 48)
                    .cornerRadius(12)
                    .shadow(color: backButtonShadow, radius: 12, x: 0, y: 4).padding(.leading, 4)
            }.padding(.bottom, 16)
            HStack {
                Text("30 Baht/Hourly.").font(kanitBold).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .frame(width: 327, height: 48)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: backButtonShadow, radius: 12, x: 0, y: 4)
            }.padding(.bottom, 40)
            VStack(alignment: .leading) {
                Text("10:00 - 12:00").padding(.bottom, 8).font(.custom("Kanit-Medium", size: 14)).foregroundColor(Color(red: 16/255, green: 16/255, blue: 16/255))
                Text("30 Baht/Hourly.").padding(.bottom, 24).font(.custom("Kanit-Bold", size: 20))
                Button(action: {
                    self.viewController?.present(style: .fullScreen) {
                        AppView()
                    }
                }) {
                    Text("BOOKING")
                        .font(.custom("Kanit-Bold", size: 20))
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 295, height:  56)
                    .background(redColor)
                    .cornerRadius(10.0)
                }
            }.padding().padding([.leading, .trailing], 1)
            .background(Color.white)
            .frame(width: 327, height: 168)
            .cornerRadius(20)
            .shadow(color: backButtonShadow, radius: 12, x: 0, y: 4)
        }
        .padding().padding([.leading, .trailing], 24)
        .background(Color.white)
        .overlay(
            RoundedCorner(radius: 20.0, corners: [.topRight, .topLeft])
                .stroke(Color.white)
        ).background(RoundedCorner(radius: 20.0, corners: [.topRight, .topLeft]).fill(Color.white))
    }
}
extension TabbarParkDetail {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct TabbarParkDetail_Previews: PreviewProvider {
    static var previews: some View {
        TabbarParkDetail()
    }
}
