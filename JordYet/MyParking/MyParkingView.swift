//
//  MyParkingView.swift
//  JordYet
//
//  Created by Surachat Yaitammasan on 13/9/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import SwiftUI
import MapKit

struct MyParkingView1: View {
    @State var directions: [CLLocation] = []
    
    @EnvironmentObject var settings: ModelMap
        

    var body: some View {
        VStack {
            MyParkingMapView()
        }
    }
}

struct MyParkingView1_Previews: PreviewProvider {
    static var previews: some View {
        MyParkingView1()
    }
}
