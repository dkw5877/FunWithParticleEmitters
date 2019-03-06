
import UIKit

class ConfettiViewController : UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let gradient = GradientView()
        gradient.startColor = UIColor(red: 0.53, green: 0.80, blue: 1.0, alpha: 1)
        gradient.endColor = UIColor(red: 0.8, green: 0.96, blue: 1.0, alpha: 1)
        gradient.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gradient)
        
        
        let image = UIImage(named: "birthday-cake")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)

        let confetti = ConfettiParticleView()
        confetti.particleImage = UIImage(named: "confetti")
        confetti.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(confetti)
        
        NSLayoutConstraint.pin(view: gradient, to: view)
        NSLayoutConstraint.pin(view: confetti, to: view)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant:200),
            imageView.widthAnchor.constraint(equalToConstant:200),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant:-16)])
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Menlo-Regular", size: 35)
        label.text = "Happy Birthday!"
        label.textAlignment = .center
        label.textColor = .blue
        label.sizeToFit()
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
        
    }
}
