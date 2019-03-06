
import UIKit.UIViewController

class FireworksViewController : UIViewController {
    
    var timer:Timer?
    let fireworks = FireworksParticleView()
    
    override func loadView() {
        let view = UIView()
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sky = GradientView()
        sky.startColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1)
        sky.endColor = UIColor(red: 0.07, green: 0.04, blue: 0.66, alpha: 1)
        sky.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sky)
        
        let image = UIImage(named: "seattle")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant:300),            imageView.leadingAnchor.constraint(equalTo:view.leadingAnchor),            imageView.trailingAnchor.constraint(equalTo:view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        
        NSLayoutConstraint.activate([
            sky.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sky.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            sky.topAnchor.constraint(equalTo: view.topAnchor),
            sky.bottomAnchor.constraint(equalTo: imageView.topAnchor)])
        
        fireworks.particleImage = UIImage(named: "tspark")
        fireworks.flareImage = UIImage(named: "tspark")
        fireworks.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fireworks)
     
        NSLayoutConstraint.activate([
            fireworks.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            fireworks.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            fireworks.topAnchor.constraint(equalTo: view.topAnchor),
            fireworks.bottomAnchor.constraint(equalTo: imageView.centerYAnchor)])
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
    }
}
