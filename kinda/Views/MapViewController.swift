//
//  SecondViewController.swift
//  kinda
//
//  Created by Elle on 1/6/21.
//

import UIKit
import MapKit


class MapViewController: UIViewController {

    private var mapView: MKMapView!


    override func viewDidLoad() {
        super.viewDidLoad()
 
        // Do any additional setup after loading the view.
        // Set initial location in Honolulu
        mapView = MKMapView()
        mapView.frame = view.bounds
        view.addSubview(mapView)
        let initialLocation = CLLocation(latitude: 34.021955, longitude: -118.283894)
        mapView.centerToLocation(initialLocation)
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
        mapView.setCameraZoomRange(zoomRange, animated: true)

    }

}

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
