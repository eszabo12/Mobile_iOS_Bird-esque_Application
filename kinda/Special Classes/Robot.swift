//
//  Robot.swift
//  kinda
//
//  Created by Elle on 1/24/21.
//

import Foundation
import MapKit


class Robot: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var homeLat: Double
    var homeLong: Double
    var lat: Double
    var long: Double
    var available: Bool
    var title: String?
    
    init(_lat: Double, _long: Double, _title: String){
        coordinate = CLLocationCoordinate2D(latitude: _lat, longitude: _long)
        homeLat = _lat
        homeLong = _long
        lat = _lat
        long = _long
        available = true
        title = _title
    }
    func makeAvailable(){
        available = true
    }
    func makeUnavailable(){
        available = false
    }
}
