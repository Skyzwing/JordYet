//
//  AppView.swift
//  JordYet
//
//  Created by Surachat Yaitammasan on 12/9/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import SwiftUI

struct AppView: View {
    
    @State var selected = 0
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            GeometryReader { geometry in
                Group {
                    VStack {
                        if self.selected == 0 {
                            HomeView()
                        } else if self.selected == 1 {
                            MyParkingView()
                        } else {
                            SettingView()
                        }
                    }
                }
            }
            
            TabbarView(selected: self.$selected).frame(height: 0)
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
