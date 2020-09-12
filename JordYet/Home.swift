//
//  Home.swift
//  JordYet
//
//  Created by Surachat Yaitammasan on 12/9/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ZStack {
            Image("bgWhite").edgesIgnoringSafeArea(.all)
            VStack {
                Text("Home!")
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
