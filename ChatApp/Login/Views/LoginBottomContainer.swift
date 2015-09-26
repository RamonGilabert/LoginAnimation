import UIKit
import Cartography

class LoginBottomContainer: UIView {

  lazy var signupButton: LoginScreenButton = LoginScreenButton(kind: .Signup)
  lazy var loginButton: LoginScreenButton = LoginScreenButton(kind: .Login)

  required init() {
    super.init(frame: CGRectZero)

    for subview in [signupButton, loginButton] { addSubview(subview) }

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
      signup.height == signup.superview!.height

      login.bottom == login.superview!.bottom
      login.centerX == login.superview!.centerX
      login.width == login.superview!.width
      login.height == login.superview!.height
    }
  }
}
