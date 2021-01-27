//
//  GameViewController.swift
//  kinda
//
//  Created by Elle on 1/16/21.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Create the capture session.
        let captureSession = AVCaptureSession()

        // Find the default video device.
        guard let videoDevice = AVCaptureDevice.default(for: .video) else { return }

        do {
            // Wrap the video device in a capture device input.
            let videoInput = try AVCaptureDeviceInput(device: videoDevice)
            // If the input can be added, add it to the session.
            if captureSession.canAddInput(videoInput) {
                captureSession.addInput(videoInput)
                
            }
            else{
                print("faileddddd1")
            }
        } catch {
            print("faileddddd2")
            // Configuration failed. Handle error.
        }
        // Create a preview layer.
        let previewLayer = AVCaptureVideoPreviewLayer()

        // Connect the preview layer with the capturing session.
        previewLayer.session = captureSession

        // Add the preview layer into the view's layer hierarchy.
        view.layer.addSublayer(previewLayer)
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
