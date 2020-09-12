//
//  MapViewCoordinator.swift
//  JordYet
//
//  Created by Surachat Yaitammasan on 12/9/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import Foundation
import MapKit

/*
  Coordinator for using UIKit inside SwiftUI.
 */
class MapViewCoordinator: NSObject, MKMapViewDelegate {
    
      var mapViewController: MapView
        
      init(_ control: MapView) {
          self.mapViewController = control
      }
        
      func mapView(_ mapView: MKMapView, viewFor
           annotation: MKAnnotation) -> MKAnnotationView?{
         //Custom View for Annotation
          let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customView")
          annotationView.canShowCallout = true
          //Your custom image icon
          annotationView.image = UIImage(named: "locationPin")
          return annotationView
       }
}

