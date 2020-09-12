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
        
      func mapView(_ mapView: MKMapView, didAdd
           views: [MKAnnotationView]) {
         //Custom View for Annotation
        
        if let annotationView = views.first {
            if let annotation = annotationView.annotation {
                if annotation is MKUserLocation {
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                    mapView.setRegion(region, animated: true)
                }
            }
        }
//          let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customView")
//          annotationView.canShowCallout = true
//          //Your custom image icon
//          annotationView.image = UIImage(named: "locationPin")
//          return annotationView
       }
}
