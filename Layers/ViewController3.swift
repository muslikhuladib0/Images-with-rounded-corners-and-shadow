
import UIKit

class ViewController3: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // constants
        let radius: CGFloat = 20, offset = 8
        let rect = CGRect(x: 0, y: 0, width: 200, height: 200)
        
        // roundedView
        let roundedView = UIView()
        view.addSubview(roundedView)
        
        // shadow layer
        let shadowLayer = CALayer()
        shadowLayer.shadowColor = UIColor.darkGray.cgColor
        shadowLayer.shadowPath = UIBezierPath(roundedRect: rect, cornerRadius: radius).cgPath
        shadowLayer.shadowOffset = CGSize(width: offset, height: offset)
        shadowLayer.shadowOpacity = 0.8
        shadowLayer.shadowRadius = 2
        roundedView.layer.addSublayer(shadowLayer)
        
        // mask layer
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: rect, cornerRadius: radius).cgPath
        
        // image layer
        let imageLayer = CALayer()
        imageLayer.mask = maskLayer
        imageLayer.frame = rect
        imageLayer.contentsGravity = kCAGravityResizeAspectFill
        imageLayer.contents = UIImage(named: "image")?.cgImage
        roundedView.layer.addSublayer(imageLayer)
        
        // auto layout
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        roundedView.widthAnchor.constraint(equalToConstant: rect.width).isActive = true
        roundedView.heightAnchor.constraint(equalToConstant: rect.height).isActive = true
        roundedView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        roundedView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
}
