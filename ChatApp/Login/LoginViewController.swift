import UIKit
import Cartography

class LoginViewController: UIViewController {

  lazy var backgroundView: LoginBackgroundView = LoginBackgroundView()
  lazy var loginBottomContainer: LoginBottomContainer = LoginBottomContainer()

  override func viewDidLoad() {
    super.viewDidLoad()

    for subview in [backgroundView, loginBottomContainer] { view.addSubview(subview) }
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
