//
//  SecondViewController.swift
//  kinda
//
//  Created by Elle on 1/6/21.
//

import UIKit
import MapKit
import Firebase


//some code from: https://www.raywenderlich.com/7738344-mapkit-tutorial-getting-started
class MapViewController: UIViewController {

    private var mapView: MKMapView!

    override func viewDidLoad() {
        var ref: DatabaseReference!

        ref = Database.database().reference()
        
        super.viewDidLoad()
 
        // Do any additional setup after loading the view.
        // Set initial location in Honolulu
        mapView = MKMapView()
        view.addSubview(mapView)
        mapView.snp.makeConstraints{ (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        let initialLocation = CLLocation(latitude: 34.021955, longitude: -118.283894)
        mapView.centerToLocation(initialLocation)
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
        let kap = AnnotationClass(coordinate: CLLocationCoordinate2D(latitude: 34.02229053526, longitude: -118.290907), title: "KAP")
        mapView.addAnnotation(kap)
        

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
