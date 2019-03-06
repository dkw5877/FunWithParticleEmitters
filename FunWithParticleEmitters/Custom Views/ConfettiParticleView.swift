
import UIKit

class ConfettiParticleView: UIView {
    
    var particleImage:UIImage?
    
    override class var layerClass:AnyClass {
        return CAEmitterLayer.self
    }
    
    func makeEmitterCell(color: UIColor) -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.birthRate = 3
        cell.lifetime = 7.0
        cell.lifetimeRange = 0
        cell.color = color.cgColor
        cell.velocity = 200
        cell.velocityRange = 50
        cell.emissionLongitude = .pi
        cell.emissionRange = .pi / 4
        cell.spin = 2
        cell.spinRange = 3
        cell.scale = 0.75
        cell.scaleRange = 0.5
        cell.scaleSpeed = -0.05
        cell.contents = particleImage?.cgImage
        return cell
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let emitter = self.layer as! CAEmitterLayer
        emitter.masksToBounds = true
        emitter.emitterShape = .line
        emitter.emitterPosition = CGPoint(x: bounds.midX, y: 0)
        emitter.emitterSize = CGSize(width: bounds.size.width, height: 1)
        
        let red = makeEmitterCell(color: UIColor.red)
        let green = makeEmitterCell(color: UIColor.green)
        let blue = makeEmitterCell(color: UIColor.blue)
        emitter.emitterCells = [red, green, blue]
    }
    
}
