
import UIKit

class ViewController2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // constants
        let radius: CGFloat = 20, dimension: CGFloat = 200, offset = 8
        
        // image view
        let imageView = UIImageView(image: UIImage(named: "image"))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = radius
        imageView.layer.masksToBounds = true
        
        // rounded view
        let roundedView = UIView()
        roundedView.layer.shadowColor = UIColor.darkGray.cgColor
        roundedView.layer.shadowPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: dimension, height: dimension), cornerRadius: radius).cgPath
        roundedView.layer.shadowOffset = CGSize(width: offset, height: offset)
        roundedView.layer.shadowOpacity = 0.8
        roundedView.layer.shadowRadius = 2
        
        // views hierarchy
        roundedView.addSubview(imageView)
        view.addSubview(roundedView)
        
        // layout
        imageView.translatesAutoresizingMaskIntoConstraints = false
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        roundedView.widthAnchor.constraint(equalToConstant: dimension).isActive = true
        roundedView.heightAnchor.constraint(equalToConstant: dimension).isActive = true
        imageView.widthAnchor.constraint(equalTo: roundedView.widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: roundedView.heightAnchor).isActive = true
        roundedView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        roundedView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: roundedView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: roundedView.centerYAnchor).isActive = true
    }
    
}
