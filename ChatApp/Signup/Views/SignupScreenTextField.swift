import UIKit
import Cartography

class SignupScreenTextField: UIView {

  enum Kind {
    case Name, Email, Password
  }

  lazy var textField: UITextField = {
    let textField = UITextField()
    return textField
    }()

  lazy var logo: UIImageView = {
    let imageView = UIImageView()
    return imageView
    }()

  var kind: Kind

  init(kind: Kind) {
    self.kind = kind
    super.init(frame: CGRectZero)

    setupConfiguration()
    setupConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Configuration

  func setupConfiguration() {
    switch kind {
    case .Name:
      print("Name")
    case .Email:
      print("Email")
    case .Password:
      print("Password")
    }
  }

  func setupConstraints() {
    
  }
}
