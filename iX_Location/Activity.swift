//
//  Activity.swift
//  iX_Location
//
//  Created by Emily Koagedal on 6/6/17.
//  Copyright © 2017 Emily Koagedal. All rights reserved.
//

import Foundation
import UIKit

class Activity {
    
    var name: String
    var description: String
    var image: UIImage?
    var location: GeoPoint
    
    init?() {
        self.name = ""
        self.description = ""
        self.image = nil
        self.location = GeoPoint(latitude: 0.0, longitude: 0.0)
    }
    
}
