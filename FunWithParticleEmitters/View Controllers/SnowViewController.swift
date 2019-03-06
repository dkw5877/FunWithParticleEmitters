
import UIKit

class SnowViewController : UIViewController {
    
    let snow = SnowParticleView()
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        let sky = GradientView()
        sky.translatesAutoresizingMaskIntoConstraints = false
        sky.startColor = UIColor(red: 0.1, green: 0.25, blue: 0.5, alpha: 1)
        sky.endColor = UIColor(red: 0.75, green: 0.8, blue: 0.9, alpha: 1)
        view.addSubview(sky)
        
        snow.translatesAutoresizingMaskIntoConstraints = false
        snow.isHidden = true
        snow.particleImage = UIImage(named: "snow")
        view.addSubview(snow)
        
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.setTitle("Make it snow", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(makeItSnow(sender:)), for: .touchUpInside)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            sky.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            sky.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            sky.topAnchor.constraint(equalTo: view.topAnchor),
            sky.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
        
        NSLayoutConstraint.activate([
            snow.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            snow.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            snow.topAnchor.constraint(equalTo: view.topAnchor),
            snow.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:16),
            button.widthAnchor.constraint(equalToConstant: 150)
            ])
    }
    
    @objc private func makeItSnow(sender:UIButton) {
        snow.isHidden.toggle() 
        toggleButtonState()
    }
    
    private func toggleButtonState() {
        if button.title(for: .normal) ==  "Make it snow"{
            button.setTitle("Make it stop", for: .normal)
            button.setTitleColor(.red, for: .normal)
        } else{
            button.setTitle("Make it snow", for: .normal)
            button.setTitleColor(.blue, for: .normal)
        }
    }

}
