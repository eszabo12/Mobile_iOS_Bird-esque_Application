//
//  SecondViewController.swift
//  kinda
//
//  Created by Elle on 1/6/21.
//

import UIKit

class LaunchController: UIViewController {
    var viewController: RootViewController!
    var logo: UIImageView!

    override open var shouldAutorotate: Bool {
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        logo = UIImageView(image: UIImage(named: "box"))
        logo.frame = CGRect(x: view.bounds.width / 2.0, y: view.bounds.height / 2.0, width: 400, height: 400)
        logo.center = view.center
        logo.isOpaque = false
        view.addSubview(logo)
        view.backgroundColor = UIColor(red: 0.84, green: 0.81, blue: 0.90, alpha: 1.00)

        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor(red: 0.79, green: 0.74, blue: 0.84, alpha: 1.00), UIColor(red: 0.98, green: 0.76, blue: 0.96, alpha: 1.00)]
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 0.75, y: 0.75)
        
        view.layer.insertSublayer(gradient, at: 0)
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.splashTimeOut(sender:)), userInfo: nil, repeats: false)
        // Do any additional setup after loading the view.
    }
    @objc
    func splashTimeOut(sender : Timer){
        viewController = RootViewController()
        viewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(viewController, animated: false)
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
