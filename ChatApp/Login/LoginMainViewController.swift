import UIKit
import Cartography

class LoginMainViewController: UIViewController {

  lazy var backgroundView: LoginBackgroundView = LoginBackgroundView()
  lazy var loginBottomContainer: LoginBottomContainer = LoginBottomContainer()
  lazy var signupViewController: SignupViewController = SignupViewController()
  lazy var loginViewController: LoginViewController = LoginViewController()

  lazy var logo: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: ImageList.Login.logo)
    imageView.contentMode = .ScaleAspectFill

    return imageView
    }()

  lazy var welcomeTitle: UILabel = {
    let label = UILabel()
    label.text = "Welcome to ChatApp"
    label.font = FontList.Login.title
    label.textColor = UIColor.whiteColor()

    return label
    }()

  lazy var separator: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.whiteColor()
    view.layer.cornerRadius = 0.5

    return view
    }()

  lazy var subtitle: UILabel = {
    let label = UILabel()
    label.text = "A new way of comunication"
    label.font = FontList.Login.subtitle
    label.textColor = UIColor.whiteColor()

    return label
    }()

  override func viewDidLoad() {
    super.viewDidLoad()

    for subview in [backgroundView, loginBottomContainer, logo, welcomeTitle, separator, subtitle] { view.addSubview(subview) }
    setupConstraints()
    setupHiddenViews()

    backgroundView.configureView()
    loginBottomContainer.delegate = self
    welcomeTitle.sizeToFit()
    subtitle.sizeToFit()
  }

  // MARK: - Configuration

  func setupConstraints() {
    let totalHeight = UIScreen.mainScreen().bounds.height

    constrain(backgroundView, loginBottomContainer) { backgroundView, loginBottomContainer in
      backgroundView.top == backgroundView.superview!.top
      backgroundView.left == backgroundView.superview!.left
      backgroundView.width == backgroundView.superview!.width
      backgroundView.height == backgroundView.superview!.height

      loginBottomContainer.width == LoginScreenButton.Dimensions.width
      loginBottomContainer.height == LoginScreenButton.Dimensions.height * 2 + LoginScreenButton.Dimensions.paddingBetween
      loginBottomContainer.centerX == loginBottomContainer.superview!.centerX
      loginBottomContainer.bottom == loginBottomContainer.superview!.bottom - 75
    }

    constrain(welcomeTitle, separator, subtitle, logo) { welcomeTitle, separator, subtitle, logo in
      welcomeTitle.centerX == welcomeTitle.superview!.centerX
      separator.centerX == separator.superview!.centerX
      subtitle.centerX == subtitle.superview!.centerX
      logo.centerX == logo.superview!.centerX

      separator.width == 60
      separator.height == 1

      welcomeTitle.bottom == welcomeTitle.superview!.centerY
      separator.top == welcomeTitle.bottom + 19
      subtitle.top == separator.bottom + 17
      logo.centerY == logo.superview!.centerY - totalHeight / 3.8
    }
  }

  func setupHiddenViews() {
    if UIScreen.mainScreen().nativeBounds.height == 960 {
      subtitle.hidden = true
      separator.hidden = true
    }
  }

  override func prefersStatusBarHidden() -> Bool {
    return true
  }
}

extension LoginMainViewController: LoginBottomContainerDelegate {

  func signupButtonDidPress() {
    presentViewController(signupViewController, animated: true, completion: nil)
  }

  func loginButtonDidPress() {
    presentViewController(loginViewController, animated: true, completion: nil)
  }
}
