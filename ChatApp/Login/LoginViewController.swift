import UIKit
import Cartography

class LoginViewController: UIViewController {

  lazy var loginBottomContainer: LoginBottomContainer = LoginBottomContainer()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = ColorList.Login.background
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
