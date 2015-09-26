import UIKit
import Cartography

class LoginViewController: UIViewController {

  lazy var backgroundView: LoginBackgroundView = LoginBackgroundView()
  lazy var loginBottomContainer: LoginBottomContainer = LoginBottomContainer()

  lazy var logo: UIImageView = {
    let imageView = UIImageView()
    return imageView
    }()

  lazy var welcomeTitle: UILabel = {
    let label = UILabel()
    return label
    }()

  lazy var separator: UIView = {
    let view = UIView()
    return view
    }()

  lazy var subtitle: UILabel = {
    let label = UILabel()
    return label
    }()

  override func viewDidLoad() {
    super.viewDidLoad()

    for subview in [backgroundView, loginBottomContainer, welcomeTitle, separator, subtitle] { view.addSubview(subview) }
    setupConstraints()

    backgroundView.configureView()
    loginBottomContainer.delegate = self
  }

  func setupConstraints() {
    constrain(backgroundView, loginBottomContainer) { backgroundView, loginBottomContainer in
      backgroundView.top == backgroundView.superview!.top
      backgroundView.left == backgroundView.superview!.left
      backgroundView.width == backgroundView.superview!.width
      backgroundView.height == backgroundView.superview!.height

      loginBottomContainer.width == LoginScreenButton.Dimensions.width
      loginBottomContainer.height == LoginScreenButton.Dimensions.height * 2 + LoginScreenButton.Dimensions.paddingBetween
      loginBottomContainer.centerX == loginBottomContainer.superview!.centerX
      loginBottomContainer.bottom == loginBottomContainer.superview!.bottom - 75
    }

    constrain(welcomeTitle, separator, subtitle) { welcomeTitle, separator, subtitle in

    }
  }

  override func prefersStatusBarHidden() -> Bool {
    return true
  }
}

extension LoginViewController: LoginBottomContainerDelegate {

  func signupButtonDidPress() {
    print("Signup")
  }

  func loginButtonDidPress() {
    print("Login")
  }
}
