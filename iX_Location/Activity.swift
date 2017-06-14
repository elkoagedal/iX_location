//
//  Activity.swift
//  iX_Location
//
//  Created by Emily Koagedal on 6/6/17.
//  Copyright © 2017 Emily Koagedal. All rights reserved.
//

import Foundation
import UIKit
import Gloss

class Activity: Decodable, Glossy {
    
    var name: String?
    var description: String?
    var image: UIImage?
    var location: GeoPoint?
    
    init?() {
        self.name = ""
        self.description = ""
        self.image = nil
        self.location = GeoPoint(latitude: 0.0, longitude: 0.0)
    }
    
    required init?(json: JSON) {
        self.name = "name" <~~ json
        self.description = "description" <~~ json
        self.location = "location" <~~ json
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "name" ~~> self.name,
            "description" ~~> self.description,
            "location" ~~> self.location
            ])
    }
    
}
