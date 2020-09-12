//
//  LandmarkMode.swift
//  JordYet
//
//  Created by Surachat Yaitammasan on 12/9/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import Foundation
import MapKit

class LandmarkAnnotion: NSObject, MKAnnotation {
    
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(model: Model) {
        self.title = model.title
        self.coordinate = model.coordinator
    }
    
//    let title: String?
//    let subtitle: String?
//    let coordinate: CLLocationCoordinate2D
//
//    init(title: String?,
//         subtitle: String?,
//         coordinate: CLLocationCoordinate2D) {
//        self.title = title
//        self.subtitle = subtitle
//        self.coordinate = coordinate
//    }
//
//    static func requestMockData()-> [LandmarkModel]{
//        return [
//            LandmarkModel(title: "Bengalore",
//                               subtitle:"Bengaluru (also called Bangalore) is the capital of India's southern Karnataka state.",
//                               coordinate: .init(latitude: 13.679720, longitude: 100.629900)),
////            13.679720,100.629900
//            LandmarkModel(title: "Mumbai",
//                               subtitle:"Mumbai (formerly called Bombay) is a densely populated city on India’s west coast",
//                               coordinate: .init(latitude: 19.0760, longitude: 100.629900))
//        ]
//    }
}
