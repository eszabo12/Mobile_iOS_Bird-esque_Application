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
    public var checkoutButton : UIButton!
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
//        kap.setValue(123, forKeyPath: "annotation")
//        kap.addObserver(self, forKeyPath: "annotation", options: .new, context: nil)
        mapView.addAnnotation(kap)
        
        checkoutButton = UIButton(frame: CGRect(x:view.center.x - 40, y: view.bounds.maxY - 100, width: 80, height: 45))
        checkoutButton.setTitle("Checkout", for: .normal)
        checkoutButton.setTitleColor(UIColor.white, for: .normal)
        // light gray color
        checkoutButton.backgroundColor = UIColor(red: 0.76, green: 0.76, blue: 0.76, alpha: 1.00)
        checkoutButton.layer.cornerRadius = 5
        checkoutButton.isEnabled = true
        checkoutButton.setBackgroundColor(color: UIColor(red: 0.86, green: 0.86, blue: 0.86, alpha: 1.00), forState: UIControl.State.highlighted)
        checkoutButton.addTarget(self,
                         action: #selector(checkoutButtonAction),
                         for: .touchUpInside)
        mapView.addSubview(checkoutButton)
    }
    @objc func checkoutButtonAction() {
        (UIApplication.shared.windows.filter {$0.isKeyWindow}.first)?.rootViewController = CheckoutViewController()
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


