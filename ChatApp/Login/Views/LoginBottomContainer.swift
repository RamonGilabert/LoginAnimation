import UIKit
import Cartography

class LoginBottomContainer: UIView {

  struct Dimensions {
    static let buttonHeight: CGFloat = 74
    static let buttonWidth: CGFloat = 120
    static let offsetButtons: CGFloat = 5
    static let offsetBottom: CGFloat = 25
  }

  lazy var signupButton: UIButton = {
    let button = UIButton()
    return button
    }()

  lazy var loginButton: UIButton = {
    let button = UIButton()
    return button
    }()

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
    }
  }
}
