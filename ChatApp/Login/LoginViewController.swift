import UIKit
import Cartography

class LoginViewController: UIViewController {

  lazy var loginBottomContainer: LoginBottomContainer = LoginBottomContainer()

  override func viewDidLoad() {
    super.viewDidLoad()

    loginBottomContainer.delegate = self

    for subview in [loginBottomContainer] { view.addSubview(subview) }

    setupConstraints()
  }

  func setupConstraints() {
    constrain(loginBottomContainer) { loginBottomContainer in
      loginBottomContainer.width == LoginScreenButton.Dimensions.width
      loginBottomContainer.height == LoginScreenButton.Dimensions.height * 2 + LoginScreenButton.Dimensions.paddingBetween
      loginBottomContainer.centerX == loginBottomContainer.superview!.centerX
      loginBottomContainer.bottom == loginBottomContainer.superview!.bottom - 75
    }
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
