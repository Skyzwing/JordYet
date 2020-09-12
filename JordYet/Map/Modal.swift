//
//  Modal.swift
//  JordYet
//
//  Created by Surachat Yaitammasan on 13/9/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import Foundation
import MapKit

struct Model {
    let placemark: MKPlacemark
    
    var id: UUID {
        return UUID()
    }
    
    var name: String {
        return self.placemark.name ?? ""
    }
    var title: String {
        return self.placemark.title ?? ""
    }
    
    var coordinator: CLLocationCoordinate2D {
        return self.placemark.coordinate
    }
}
