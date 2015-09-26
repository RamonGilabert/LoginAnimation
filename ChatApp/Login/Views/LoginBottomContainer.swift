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
      login.bottom == login.superview!.bottom

      for button in [signup, login] {
        button.centerX == button.superview!.centerX
        button.width == button.superview!.width
        button.height == LoginScreenButton.Dimensions.height
      }
    }
  }
}

extension LoginBottomContainer: LoginScreenButtonDelegate {

  func signupButtonDidPress() { delegate?.signupButtonDidPress() }

  func loginButtonDidPress() { delegate?.loginButtonDidPress() }
}
