//
//  Home.swift
//  JordYet
//
//  Created by Surachat Yaitammasan on 12/9/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    let lightGray = Color(red: 173, green: 172, blue: 173)
    let blur = Color(red: 0, green: 0, blue: 0, opacity: 0.1)
    var colors = ["Red", "Green", "Blue", "Tartan"]
    @State private var selectedColor = 0
    @State var address = ""
    @State var checkIn = "Check-In"
    @State var checkOut = "Check-Out"
    @State var selectedTime = false
    @Environment(\.viewController) private var viewControllerHolder: ViewControllerHolder
    private var viewController: UIViewController? {
        self.viewControllerHolder.value
    }
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("bgWhite").resizable().aspectRatio(geometry.size, contentMode: .fill).edgesIgnoringSafeArea(.all)
                VStack {
                    Image("icAddToCartCopy25").resizable().frame(width: 163.0, height: 163.0).padding()
                    TextField("Enter Address Or Place", text: self.$address).padding()
                        .background(Color.white)
                        .cornerRadius(10.0)
                        .font(.custom("Kanit-Regular", size: 16))
                        .shadow(color: self.blur, radius: 24, x: 0, y: 4)
                        .padding(.bottom, 24)
                    VStack {
                        HStack {
                            
                            Button(action: {
                                self.selectedTime.toggle()
                            }) {
                                Spacer()
                                Text("\(self.checkIn)").padding().foregroundColor(.gray).cornerRadius(10).font(.custom("Kanit-Bold", size: 16))
                                Spacer()
                            }.background(Color.white).shadow(color: self.blur, radius: 24, x: 0, y: 4).padding(.trailing, 12)
                            
                            Button(action: {
                                print("A")
                            }) {
                                Spacer()
                                Text("\(self.checkOut)").padding().foregroundColor(.gray).cornerRadius(10).font(.custom("Kanit-Bold", size: 16))
                                Spacer()
                            }.background(Color.white).shadow(color: self.blur, radius: 24, x: 0, y: 4).padding(.leading, 12)
                            
    //                        TextField("Check-In", text: self.$address).padding()
    //                        .background(Color.white)
    //                        .cornerRadius(10.0)
    //                        .font(.custom("Kanit-Regular", size: 16))
    //                        .shadow(color: self.blur, radius: 24, x: 0, y: 4).padding(.trailing, 12)
    //
    //                        TextField("Check-Out", text: self.$address).padding()
    //                        .background(Color.white)
    //                        .cornerRadius(10.0)
    //                        .font(.custom("Kanit-Regular", size: 16))
    //                        .shadow(color: self.blur, radius: 24, x: 0, y: 4).padding(.leading, 12)
                        }.padding(.bottom, 24)
                    }
                    Group {
                        Button(action: {
                            print("A")
                        }) {
                            Text("SELECT A DESTINATION").padding().foregroundColor(.white).background(Color.red).cornerRadius(10).font(.custom("Kanit-Bold", size: 16))
                        }.padding(.bottom, 24)
                        Text("Or").padding(.bottom, 24)
                        Button(action: {
                            self.viewController?.present(style: .fullScreen) {
                                MapShowView(showingAlert: false)
                            }
                        }) {
                            Text("SELECT A DESTINATION").foregroundColor(.red)
                            .padding()
                               .overlay(
                                   RoundedRectangle(cornerRadius: 10)
                                       .stroke(Color.red, lineWidth: 2)
                               ).background(Color.white)
                        }
                    }
                }.padding([.leading, .trailing], 24)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
