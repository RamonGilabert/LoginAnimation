import UIKit

protocol LoginScreenButtonDelegate: class {

  func loginButtonDidPress()
  func signupButtonDidPress()
}

class LoginScreenButton: UIButton {

  struct Dimensions {
    static let width: CGFloat = 265
    static let height: CGFloat = 52
    static let paddingBetween: CGFloat = 12
    static let offset: CGFloat = 110
  }

  enum Kind {
    case Login, Signup
  }

  weak var delegate: LoginScreenButtonDelegate?
  var kind: Kind

  required init(kind: Kind) {
    self.kind = kind
    super.init(frame: CGRectZero)

    setupConfiguration()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK - Configuration

  func setupConfiguration() {
    layer.cornerRadius = 6
    titleLabel?.font = FontList.Login.button

    switch kind {
    case .Signup:
      backgroundColor = ColorList.Login.button
      setTitle("Sign up", forState: .Normal)
      setTitleColor(UIColor.whiteColor(), forState: .Normal)
      addTarget(self, action: "signupButtonDidPress", forControlEvents: .TouchUpInside)
    case .Login:
      backgroundColor = UIColor.clearColor()
      layer.borderWidth = 2
      layer.borderColor = ColorList.Login.button.CGColor
      setTitle("Log in", forState: .Normal)
      setTitleColor(ColorList.Login.button, forState: .Normal)
      addTarget(self, action: "loginButtonDidPress", forControlEvents: .TouchUpInside)
    }
  }

  // MARK: - Action methods

  func signupButtonDidPress() { delegate?.signupButtonDidPress() }
  
  func loginButtonDidPress() { delegate?.loginButtonDidPress() }
}
