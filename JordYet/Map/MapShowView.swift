//
//  MapShowView.swift
//  JordYet
//
//  Created by Surachat Yaitammasan on 12/9/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import SwiftUI
import MapKit

struct MapShowView: View {
    @ObservedObject private var locationManager = LocationManager()
    @State var address = ""
    
    @State var landmark = [Model]()
    @State var showingAlert: Bool
    
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
    
    //    func calculateOffSet() -> CGFloat {
    //        sele
    //    }
    
    var body: some View {
        ZStack(alignment: .top) {
            MapView(landmarks: landmark, showingAlert: $showingAlert).edgesIgnoringSafeArea(.all).modal(isPresented: $showingAlert) {
                MapDetailView()
            }
            VStack {
                VStack {
                    HStack {
                        Button(action: {print("Button Tapped")}) {
                            BackButton()
                        }
                        .buttonStyle(PlainButtonStyle()).padding(.trailing, 4)
                        
                        TextField("Enter Address Or Place", text: self.$address, onEditingChanged:  { _ in }) {
                            self.getNearlyByLandmark()
                        }
                        .font(kanitRegular)
                        .foregroundColor(pinkishGrey)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: backButtonShadow, radius: 12, x: 0, y: 4).padding(.leading, 4)
                        
                    }
                    HStack {
                        TextField("12:00", text: self.$address, onEditingChanged:  { _ in }) {
                            self.getNearlyByLandmark()
                        }
                        .font(kanitRegular)
                        .foregroundColor(pinkishGrey)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: backButtonShadow, radius: 12, x: 0, y: 4).padding(.trailing, 8)
                        TextField("14:00", text: self.$address, onEditingChanged:  { _ in }) {
                            self.getNearlyByLandmark()
                        }
                        .font(kanitRegular)
                        .foregroundColor(pinkishGrey)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: backButtonShadow, radius: 12, x: 0, y: 4).padding(.leading, 8)
                    }
                }.padding()
                Spacer()
                MapDetailView().cornerRadius(20)
            }
        }}
}

//struct MapShowView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapShowView(showingAlert: Binding<Bool>.constant(true))
//    }
//}
