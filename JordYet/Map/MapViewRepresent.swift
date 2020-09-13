//
//  MapView.swift
//  JordYet
//
//  Created by Surachat Yaitammasan on 12/9/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    func updateUIView(_ uiView: MKMapView, context: Context) {
        updateAnnotion(from: uiView)
    }
    
    
//    let landmarks = LandmarkModel.requestMockData()
    let landmarks: [Model]
    @Binding var showingAlert: Bool
    @Binding var callOut: Bool
    
    func makeCoordinator() -> MapViewCoordinator {
        MapViewCoordinator(self, showingAlert: self.$showingAlert, callOut: self.$callOut)
    }
    
    /**
     - Description - Replace the body with a make UIView(context:) method that creates and return an empty MKMapView
     */
    func makeUIView(context: Context) -> MKMapView{
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
        
    }
    
//    func updateUIView(_ view: MKMapView, context: Context){
//        //If you changing the Map Annotation then you have to remove old Annotations
//        //mapView.removeAnnotations(mapView.annotations)
//        view.delegate = context.coordinator
//        view.addAnnotations(landmarks)
//    }
    func updateAnnotion(from mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        let annotions = self.landmarks.map(LandmarkAnnotion.init)
        mapView.addAnnotations(annotions)
    }
    
}
