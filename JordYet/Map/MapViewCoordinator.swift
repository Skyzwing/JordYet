import Foundation
import MapKit
import SwiftUI

/*
  Coordinator for using UIKit inside SwiftUI.
 */
class MapViewCoordinator: NSObject, MKMapViewDelegate {
    
      var mapViewController: MapView
     @Binding var showAlert: Bool
        
      init(_ control: MapView, showingAlert: Binding<Bool>) {
          self.mapViewController = control
         self._showAlert = showingAlert
      }
        
      func mapView(_ mapView: MKMapView, didAdd
           views: [MKAnnotationView]) {
         //Custom View for Annotation
        
        if let annotationView = views.first {
            if let annotation = annotationView.annotation {
                if annotation is MKUserLocation {
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                    mapView.setRegion(region, animated: true)
                    mapView.selectAnnotation(annotation, animated: true)
                }
            }
        }
        
//          let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customView")
//          annotationView.canShowCallout = true
//          //Your custom image icon
//          annotationView.image = UIImage(named: "locationPin")
//          return annotationView
       }
    func mapView(_ mapView: MKMapView, viewFor
        annotation: MKAnnotation) -> MKAnnotationView?{
      //Custom View for Annotation
       let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customView")
       annotationView.canShowCallout = true
       //Your custom image icon
       annotationView.image = UIImage(named: "icAddToCartCopy25")
//        annotationView.detailCalloutAccessoryView = MapDetailView()
       return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("select")
    }
}
