
import UIKit

class GradientView:UIView {
    
    var startColor:UIColor = .white
    var endColor:UIColor = .white
    
    override class var layerClass:AnyClass{
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        (layer as! CAGradientLayer).colors = [startColor.cgColor, endColor.cgColor]
    }
}

