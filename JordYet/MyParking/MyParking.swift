//
//  MyParking.swift
//  JordYet
//
//  Created by Surachat Yaitammasan on 12/9/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import SwiftUI
import MapKit

struct MyParkingView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject private var locationManager = LocationManager()
    
    @State var start = ""
    @State var end = ""
    
    @State var landmark = [Model]()
    @State var showingAlert: Bool = false
    @State var callOut: Bool = false
    @State var address = ""
//    @State var directions: [CLLocation] = []@State var directions: [CLLocation] = []
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    
    private func getNearlyByLandmark() {
        guard let location = self.locationManager.location else { return }
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = self.address
        request.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        
        let search = MKLocalSearch(request: request)
        search.start { result, error in
            guard let result = result, error == nil else { return }
            
            let mapItems = result.mapItems
            self.landmark = mapItems.map {
                Model(placemark: $0.placemark)
            }
        }
    }
    
    var body: some View {
        ZStack(alignment: .top) {
//            MyParkingView.edgesIgnoringSafeArea(.all).modal(isPresented: $showingAlert) {
//                MapDetailView()
//            }
            Spacer()
            MapDetailView()
        }
    }
}


