
import UIKit

class ContainerViewController: UIViewController {

    let scrollView :UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        scrollView.backgroundColor = .gray
        return scrollView
    }()
    
    let content = [SnowViewController(), ConfettiViewController(), FireworksViewController()]
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func loadView() {
        view = UIView(frame: UIScreen.main.bounds)
        scrollView.frame = view.frame
        view.addSubview(scrollView)
        NSLayoutConstraint.pin(view: scrollView, to: view)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureChildren()
    }

    private func configureChildren() {
        for controller in content {
            add(child: controller, in: scrollView)
            controller.view.frame = view.frame
            controller.view.frame.origin.x = scrollView.contentSize.width
            scrollView.contentSize.width += view.frame.size.width
        }
    }
}

