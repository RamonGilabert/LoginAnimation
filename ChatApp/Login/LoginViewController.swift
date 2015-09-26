import UIKit

class LoginViewController: UIViewController {

  lazy var loginBottomContainer: LoginBottomContainer = {
    let view = LoginBottomContainer()
    return view
    }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = ColorList.Login.background
  }

  func setupConstraints() {

  }
}
