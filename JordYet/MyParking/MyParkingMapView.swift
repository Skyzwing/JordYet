//
//  MyParkingMapView.swift
//  JordYet
//
//  Created by Surachat Yaitammasan on 13/9/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import SwiftUI
import Foundation
import MapKit

struct MyParkingMapView: UIViewRepresentable {
    @EnvironmentObject var settings: ModelMap
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = .blue
        renderer.lineWidth = 4
        return renderer
    }
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        var locationManager = CLLocationManager()
        var currentLoc: CLLocation!
        currentLoc = locationManager.location
        print(settings.lat)
        print(settings.long)
        let sourceCoordinator = CLLocationCoordinate2D(latitude: currentLoc.coordinate.latitude, longitude: currentLoc.coordinate.longitude)
        let destinationCoordinator = CLLocationCoordinate2D(latitude: settings.lat, longitude: settings.long)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 13.086, longitude: 80.2727), latitudinalMeters: 1000, longitudinalMeters: 1000)
        
        let sourcePin = MKPointAnnotation()
        sourcePin.coordinate = sourceCoordinator
        sourcePin.title = "My Location"
        map.addAnnotation(sourcePin)
        
        let dest = MKPointAnnotation()
        dest.coordinate = destinationCoordinator
        dest.title = "Destination"
        map.addAnnotation(dest)
        
        map.region = region
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: sourceCoordinator))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destinationCoordinator))
        
        let direction = MKDirections(request: request)
        direction.calculate { destination, error in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            
            let polyline = destination?.routes.first?.polyline
            map.addOverlay(polyline!)
            map.setRegion(MKCoordinateRegion(polyline!.boundingMapRect), animated: true)
        }
        return MKMapView()
    }

    func updateUIView(_ mapView: MKMapView, context: Context) {
        
    }
}
