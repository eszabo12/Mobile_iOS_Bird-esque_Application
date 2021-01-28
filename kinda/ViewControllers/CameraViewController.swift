
import AVFoundation
import SnapKit

class CameraViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .authorized: // The user has previously granted access to the camera.
                self.setupCaptureSession()
            
            case .notDetermined: // The user has not yet been asked for camera access.
                AVCaptureDevice.requestAccess(for: .video) { granted in
                    if granted {
                        self.setupCaptureSession()
                    }
                }
            
            case .denied: // The user has previously denied access.
                return

            case .restricted: // The user can't grant access due to restrictions.
                return
        @unknown default:
            print("oopsies")
            
            configureButton(addButton: forwardButton)
            configureButton(addButton: leftButton)
            configureButton(addButton: rightButton)
            configureButton(addButton: backButton)
            leftButton.snp.makeConstraints{ (make) in
                make.left.equalTo(view.snp_left).offset(100)
                make.bottom.equalTo(view.snp_bottom).offset(-100)
            }
            rightButton.snp.makeConstraints{ (make) in
                make.left.equalTo(leftButton.snp_right).offset(rightButton.bounds.height + 20)
            }
            forwardButton.snp.makeConstraints{ (make) in
                make.bottom.equalTo(leftButton.snp_top).offset(-10)
                make.left.equalTo(leftButton.snp_right).offset(10)
            }
            backButton.snp.makeConstraints{ (make) in
                make.left.equalTo(forwardButton)
                make.top.equalTo(leftButton.snp_bottom).offset(10)
            }
        }
        
        
    }
    func setupCaptureSession(){
        let captureSession = AVCaptureSession()
        captureSession.beginConfiguration()
        let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera,
                                                  for: .video, position: .unspecified)
        guard
            let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice!),
            captureSession.canAddInput(videoDeviceInput)
            else { return }
        captureSession.addInput(videoDeviceInput)
        let previewView = PreviewView()
        captureSession.commitConfiguration()
        previewView.videoPreviewLayer.session = captureSession
        previewView.videoPreviewLayer.session?.startRunning()
        view.addSubview(previewView)
        previewView.snp.makeConstraints{ (make) in
            make.edges.equalTo(view)
        }
        
    }
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
}

class PreviewView: UIView {
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
    
    /// Convenience wrapper to get layer as its statically known type.
    var videoPreviewLayer: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
    }
}

func configureButton(addButton: UIButton)
{
    addButton.layer.cornerRadius = 0.5 * addButton.bounds.size.width
    addButton.layer.borderColor = UIColor.darkGray as! CGColor
    addButton.layer.borderWidth = 2.0
    addButton.clipsToBounds = true
}
