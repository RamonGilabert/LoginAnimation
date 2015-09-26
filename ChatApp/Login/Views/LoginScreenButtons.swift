import UIKit

class LoginScreenButtons: UIButton {

  enum Kind {
    case Login, Signup
  }

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
    setTitle("Login", forState: .Normal)
    titleLabel?.font = FontList.Login.button

    switch kind {
    case .Login:
      backgroundColor = ColorList.Login.button
      setTitleColor(UIColor.whiteColor(), forState: .Normal)
    case .Signup:
      backgroundColor = UIColor.clearColor()
      layer.borderWidth = 2
      layer.borderColor = ColorList.Login.button.CGColor
      setTitleColor(ColorList.Login.button, forState: .Normal)
    }
  }
}
