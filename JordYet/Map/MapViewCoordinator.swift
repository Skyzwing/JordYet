import Foundation
import MapKit
import SwiftUI
import CoreLocation

/*
 Coordinator for using UIKit inside SwiftUI.
 */
class MapViewCoordinator: NSObject, MKMapViewDelegate {
    
    var mapViewController: MapView
    @Binding var showAlert: Bool
    @Binding var callOut: Bool
    @EnvironmentObject var settings: ModelMap
    
    init(_ control: MapView, showingAlert: Binding<Bool>, callOut: Binding<Bool>) {
        self.mapViewController = control
        self._showAlert = showingAlert
        self._callOut = callOut
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
    }
    
//    func mapView(_ mapView: MKMapView, viewFor
//        annotation: MKAnnotation) -> MKAnnotationView?{
//        //Custom View for Annotation
//        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customView")
//        annotationView.canShowCallout = true
//        if annotationView.canShowCallout == true {
//            self.callOut = true
//        }
//        //Your custom image icon
////        annotationView.image = UIImage(named: "icAddToCartCopy25")
//        //        annotationView.detailCalloutAccessoryView = MapDetailView()
//        return annotationView
//    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }

        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
            if annotationView!.canShowCallout == true {
                self.callOut = true
                print(callOut)
            }
        } else {
            annotationView!.annotation = annotation
        }

        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        var locationManager = CLLocationManager()
        var currentLoc: CLLocation!
        var selectedAnnotation = view.isSelected
        var annotation = view.annotation
        if selectedAnnotation == true {
            print("yes")
            callOut = true
//            self.settings.lat = annotation?.coordinate.latitude ?? 0.00
//            self.settings.long = annotation?.coordinate.longitude ?? 0.00
        }
    }
}
