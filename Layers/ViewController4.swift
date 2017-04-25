
import UIKit

class CustomView: UIView {
    
    var imageLayer: CALayer!
    var image: UIImage? {
        didSet { refreshImage() }
    }
    
    override var intrinsicContentSize:
        
        
        CGSize {
        return CGSize(width: 200, height: 200)
    }
    
    func refreshImage() {
        if let imageLayer = imageLayer, let image = image {
            imageLayer.contents = image.cgImage
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if imageLayer == nil {
            let radius: CGFloat = 20, offset: CGFloat = 8
            
            let shadowLayer = CALayer()
            shadowLayer.shadowColor = UIColor.darkGray.cgColor
            shadowLayer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
            shadowLayer.shadowOffset = CGSize(width: offset, height: offset)
            shadowLayer.shadowOpacity = 0.8
            shadowLayer.shadowRadius = 2
            layer.addSublayer(shadowLayer)
            
            let maskLayer = CAShapeLayer()
            maskLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
            
            imageLayer = CALayer()
            imageLayer.mask = maskLayer
            imageLayer.frame = bounds
            imageLayer.backgroundColor = UIColor.red.cgColor
            imageLayer.contentsGravity = kCAGravityResizeAspectFill
            layer.addSublayer(imageLayer)
        }
        
        
        refreshImage()
    }
    
}

import UIKit

class ViewController4: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let roundedView = CustomView()
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(roundedView)
        
        // auto layout
        let horizontalConstraint = roundedView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraint = roundedView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint])
        
        roundedView.image = UIImage(named: "image")
    }
    
}
