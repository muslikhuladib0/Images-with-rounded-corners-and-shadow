
import UIKit

class ViewController1: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // constants
        let radius: CGFloat = 20, dimension: CGFloat = 200, offset = 8
        let frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        
        // custom view
        let customView = UIView(frame: frame)
        customView.contentMode = .scaleAspectFill
        
        // image layer
        let imageLayer = CALayer()
        imageLayer.contentsGravity = kCAGravityResizeAspectFill
        imageLayer.contents = UIImage(named: "image")!.cgImage
        imageLayer.masksToBounds = true
        imageLayer.frame = frame
        imageLayer.cornerRadius = radius
        imageLayer.masksToBounds = true
        
        // rounded layer
        let roundedLayer = CALayer()
        roundedLayer.shadowColor = UIColor.darkGray.cgColor
        roundedLayer.shadowPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: dimension, height: dimension), cornerRadius: radius).cgPath
        roundedLayer.shadowOffset = CGSize(width: offset, height: offset)
        roundedLayer.shadowOpacity = 0.8
        roundedLayer.shadowRadius = 2
        roundedLayer.frame = frame
        
        // views and layers hierarchy
        customView.layer.addSublayer(imageLayer)
        customView.layer.insertSublayer(roundedLayer, below: imageLayer)
        view.addSubview(customView)
        
        // layout
        customView.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        customView.autoresizingMask = [UIViewAutoresizing.flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
    }
    
}
