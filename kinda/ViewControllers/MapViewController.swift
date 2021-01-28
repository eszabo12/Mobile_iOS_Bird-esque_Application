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
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        
        ref = Database.database().reference()
        
        
        super.viewDidLoad()
 
        // Do any additional setup after loading the view.
        // Set initial location in Honolulu
        mapView = MKMapView()
        mapView.register(MKPinAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)

        view.addSubview(mapView)
        initBots()
//        mapView?.showsUserLocation = true
        mapView.snp.makeConstraints{ (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        let initialLocation = CLLocation(latitude: 34.021955, longitude: -118.283894)
        mapView.centerToLocation(initialLocation)
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
        mapView.setCameraZoomRange(zoomRange, animated: true)

        
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
        (UIApplication.shared.windows.filter {$0.isKeyWindow}.first)?.rootViewController = CameraViewController()
    }
    func initBots(){
        ref.observe(DataEventType.childAdded, with: { (snapshot) in
          let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            if (postDict["Lat"] != nil) {
                let annotation = Robot(_lat: postDict["Lat"] as! Double, _long: postDict["Long"] as! Double, _title: snapshot.key)
                let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: snapshot.key)
                let btn = UIButton(type: .detailDisclosure)
                annotationView.rightCalloutAccessoryView = btn
                self.mapView.addAnnotation(annotation)

//                self.mapView.addSubview(annotationView)
                print("observation observed")
            }

        })
        var object: [String: Any] = [
            "Lat" : 34.02556389468218,
            "Long" : -118.28437298126532,
            "Available" : true
        ]
        ref.child("bot1").setValue(object)
        object = [
            "Lat" : 34.02229053526,
            "Long" : -118.290907,
            "Available" : true
        ]
        ref.child("bot2").setValue(object)
        
    }
    func annotationTapped(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("annotation tapped")
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


