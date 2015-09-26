import UIKit
import Cartography

class SignupScreenTextField: UIView {

  struct Dimensions {
    static let height: CGFloat = 52
    static let offset: CGFloat = 72
    static let offsetBetween: CGFloat = 12
    static let offsetLeft: CGFloat = 45
  }

  enum Kind {
    case Name, Email, Password
  }

  lazy var textField: UITextField = {
    let textField = UITextField()
    textField.font = FontList.Login.textField
    textField.textColor = UIColor.whiteColor()

    return textField
    }()

  lazy var logo: UIImageView = UIImageView()

  var logoSize = CGSize(width: 0, height: 0)
  var logoLeftOffset: CGFloat = 0
  var kind: Kind

  init(kind: Kind) {
    self.kind = kind
    super.init(frame: CGRectZero)

    for subview in [textField, logo] { addSubview(subview) }

    setupConfiguration()
    setupConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Configuration

  func setupConfiguration() {
    backgroundColor = UIColor.clearColor()
    layer.cornerRadius = 6
    layer.borderColor = UIColor.whiteColor().CGColor
    layer.borderWidth = 2

    switch kind {
    case .Name:
      logoSize = CGSize(width: 23.3, height: 23.4)
      logoLeftOffset = 14
      textField.attributedPlaceholder = NSAttributedString(string: "Full name",
        attributes: [NSForegroundColorAttributeName : UIColor.lightGrayColor()])
      logo.image = UIImage(named: ImageList.Login.nameLogo)
    case .Email:
      logoSize = CGSize(width: 20, height: 16)
      logoLeftOffset = 15
      textField.attributedPlaceholder = NSAttributedString(string: "Email",
        attributes: [NSForegroundColorAttributeName : UIColor.lightGrayColor()])
      logo.image = UIImage(named: ImageList.Login.emailLogo)
    case .Password:
      logoSize = CGSize(width: 17, height: 23)
      logoLeftOffset = 17
      textField.attributedPlaceholder = NSAttributedString(string: "Password",
        attributes: [NSForegroundColorAttributeName : UIColor.lightGrayColor()])
      logo.image = UIImage(named: ImageList.Login.passwordLogo)
    }
  }

  func setupConstraints() {
    constrain(logo, textField) { logo, textField in
      logo.centerY == logo.superview!.centerY
      logo.left == logo.superview!.left + logoLeftOffset
      logo.width == logoSize.width
      logo.height == logoSize.height

      textField.left == textField.superview!.left + Dimensions.offsetLeft
      textField.centerY == textField.superview!.centerY + 1
      textField.width == textField.superview!.width - Dimensions.offsetLeft
      textField.height == textField.superview!.height
    }
  }
}
