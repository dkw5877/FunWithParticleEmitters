
import UIKit

class SnowParticleView:UIView {
    
    var particleImage:UIImage?
    
    override class var layerClass:AnyClass {
        return CAEmitterLayer.self
    }
    
    func makeEmmiterCell(color:UIColor, velocity:CGFloat, scale:CGFloat)-> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.birthRate = 10
        cell.lifetime = 20.0
        cell.lifetimeRange = 0
        cell.velocity = velocity
        cell.velocityRange = velocity / 4
        cell.emissionLongitude = .pi
        cell.emissionRange = .pi / 8
        cell.scale = scale
        cell.scaleRange = scale / 3
        cell.contents = particleImage?.cgImage
        return cell
    }
    
    override func layoutSubviews() {
        let emitter = self.layer as! CAEmitterLayer
        emitter.masksToBounds = true
        emitter.emitterShape = .line
        emitter.emitterPosition = CGPoint(x: bounds.midX, y: 0)
        emitter.emitterSize = CGSize(width: bounds.size.width, height: 1)
        
        let near = makeEmmiterCell(color: UIColor(white: 1, alpha: 1), velocity: 100, scale: 0.3)
        let middle = makeEmmiterCell(color: UIColor(white: 1, alpha: 0.66), velocity: 80, scale: 0.2)
        let far = makeEmmiterCell(color: UIColor(white: 1, alpha: 0.33), velocity: 60, scale: 0.1)
        
        emitter.emitterCells = [near, middle, far]
    }
    
}
