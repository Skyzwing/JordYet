//
//  MapDetailView.swift
//  JordYet
//
//  Created by Surachat Yaitammasan on 13/9/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import SwiftUI

struct MapDetailView: View {
    @Environment(\.viewController) private var viewControllerHolder: ViewControllerHolder
    private var viewController: UIViewController? {
        self.viewControllerHolder.value
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Creative Me").font(.custom("Kanit-Bold", size: 20))
                        Text("43 Ban Rawipha Sukhumvit Alley, Bang Chak, Phra Khanong, Bangkok 10260").foregroundColor(.init(red: 0, green: 0, blue: 0, opacity: 50)).font(.custom("Kanit-Medium", size: 14)).lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.bottom, -8)
                        HStack {
                            Image("icAddToCartCopy28").resizable().frame(width: 16, height: 16)
                            Text("8/10 Parking").font(.custom("Kanit-Medium", size: 14))
                        }.padding(.bottom, -8)
                        HStack {
                            Image("icAddToCartCopy23").resizable().frame(width: 16, height: 16)
                            Image("icAddToCartCopy23").resizable().frame(width: 16, height: 16)
                            Image("icAddToCartCopy23").resizable().frame(width: 16, height: 16)
                            Image("icAddToCartCopy23").resizable().frame(width: 16, height: 16)
                            Image("icAddToCartCopy23").resizable().frame(width: 16, height: 16)
                        }.padding(.bottom, -8)
                        Text("Creative Me").font(.custom("Kanit-Bold", size: 20))
                        Text("Creative Me").font(.custom("Kanit-Bold", size: 20))
                        Text("Creative Me").font(.custom("Kanit-Bold", size: 20)).padding(.bottom, 24)
                        Button(action: {
                            self.viewController?.present(style: .fullScreen) {
                                ParkingFullDetail()
                            }
                            
                        }) {
                            Spacer()
                            Text("BOOK HEAR")
                            .font(kanitBold)
                            .foregroundColor(.white)
                            .padding()
                            Spacer()
                        }.background(redColor).cornerRadius(10.0)
                    }.padding()
                    Spacer()
                }
                .padding(15)
                .frame(width: 343, height: 336, alignment: .leading)
            }
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
        }
    }
}


struct MapDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MapDetailView()
    }
}
