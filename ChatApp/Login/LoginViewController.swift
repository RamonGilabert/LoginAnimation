import UIKit
import Cartography

class LoginViewController: UIViewController {

  lazy var backgroundView: LoginBackgroundView = LoginBackgroundView()
  lazy var loginButton: LoginScreenButton = LoginScreenButton(kind: .Login)

  lazy var logo: UIImageView = {
    let imageView = UIImageView()
    return imageView
    }()

  lazy var closeButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: ImageList.Login.closeButton), forState: .Normal)

    return button
    }()

  override func viewDidLoad() {
    super.viewDidLoad()

    for subview in [backgroundView, loginButton, logo, closeButton] { view.addSubview(subview) }
    setupConstraints()

    backgroundView.configureView()
  }

  override func prefersStatusBarHidden() -> Bool {
    return true
  }

  // MARK: - Configuration

  func setupConstraints() {
    constrain(backgroundView, loginButton, logo, closeButton) { backgroundView, loginButton, logo, closeButton in
      backgroundView.top == backgroundView.superview!.top
      backgroundView.left == backgroundView.superview!.left
      backgroundView.width == backgroundView.superview!.width
      backgroundView.height == backgroundView.superview!.height

      closeButton.top == closeButton.superview!.top + 20
      closeButton.left == closeButton.superview!.left + 20
      closeButton.width == 20
      closeButton.height == 20
    }
  }
}
