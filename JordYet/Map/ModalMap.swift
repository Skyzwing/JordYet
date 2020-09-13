//
//  ModalMap.swift
//  JordYet
//
//  Created by Surachat Yaitammasan on 13/9/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import Foundation
import SwiftUI

class ModelMap: ObservableObject {
    @Published var lat: Double = 0.00
    @Published var long: Double = 0.00
}
