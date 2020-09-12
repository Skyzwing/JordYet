//
//  MapShowView.swift
//  JordYet
//
//  Created by Surachat Yaitammasan on 12/9/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import SwiftUI

struct MapShowView: View {
    @ObservedObject private var locationManager = LocationManager()
    var body: some View {
        MapView()
    }
}

struct MapShowView_Previews: PreviewProvider {
    static var previews: some View {
        MapShowView()
    }
}
