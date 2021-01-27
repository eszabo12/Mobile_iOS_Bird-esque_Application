//
//  ViewController.swift
//  kinda
//
//  Created by Elle on 1/16/21.
//

import UIKit
import PassKit

class CheckoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.systemBlue.cgColor, UIColor.systemPurple.cgColor]
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 0.75, y: 0.75)
        view.layer.insertSublayer(gradient, at: 0)
        let label = UILabel()
        view.addSubview(label)
        label.snp.makeConstraints{ (make) in
            make.center.equalTo(view.snp.center)
        }
        label.text = "Checkout completed! You have purchased KAP."
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.86, green: 0.86, blue: 0.86, alpha: 1.00)
//        let alert = UIAlertController(title: "Go back to map?", message: "You can purchase another building", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
//            (UIApplication.shared.windows.filter {$0.isKeyWindow}.first)?.rootViewController = MapViewController()
//        }))
//        self.present(alert, animated: true)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
