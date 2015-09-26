import UIKit
import Cartography

protocol LoginBottomContainerDelegate: class {

  func signupButtonDidPress()
  func loginButtonDidPress()
}

class LoginBottomContainer: UIView {

  lazy var signupButton: LoginScreenButton = LoginScreenButton(kind: .Signup)
  lazy var loginButton: LoginScreenButton = LoginScreenButton(kind: .Login)

  weak var delegate: LoginBottomContainerDelegate?

  required init() {
    super.init(frame: CGRectZero)

    for subview in [signupButton, loginButton] {
      subview.delegate = self
      addSubview(subview)
    }

    setupConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Constraints

  func setupConstraints() {
    constrain(signupButton, loginButton) { signup, login in
      signup.top == signup.superview!.top
      signup.centerX == signup.superview!.centerX
      signup.width == signup.superview!.width
      signup.height == LoginScreenButton.Dimensions.height

      login.bottom == login.superview!.bottom
      login.centerX == login.superview!.centerX
      login.width == login.superview!.width
      login.height == LoginScreenButton.Dimensions.height
    }
  }
}

extension LoginBottomContainer: LoginScreenButtonDelegate {

  func signupButtonDidPress() { delegate?.signupButtonDidPress() }

  func loginButtonDidPress() { delegate?.loginButtonDidPress() }
}
