//
//  AnnotationClass.swift
//  kinda
//
//  Created by Elle on 1/9/21.
//


// pieces of code from: https://www.raywenderlich.com/7738344-mapkit-tutorial-getting-started
import MapKit

class AnnotationClass: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(
      coordinate: CLLocationCoordinate2D,
      title: String? = ""
    ) {
      self.coordinate = coordinate
      self.title = title
      super.init()
    }
}
