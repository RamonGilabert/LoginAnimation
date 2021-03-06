import UIKit
import Cartography
import Transition

protocol LoginViewControllerDelegate: class {

  func didLoginSuccessfully()
}

class LoginViewController: UIViewController {

  lazy var backgroundView: LoginBackgroundView = LoginBackgroundView()
  lazy var loginButton: LoginScreenButton = LoginScreenButton(kind: .Login)
  lazy var emailTextField: SignupScreenTextField = SignupScreenTextField(kind: .Email)
  lazy var passwordTextField: SignupScreenTextField = SignupScreenTextField(kind: .Password)
  lazy var transitionManager: LoginTransitionManager = LoginTransitionManager()

  lazy var logo: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: ImageList.Login.logo)
    imageView.contentMode = .ScaleAspectFill

    return imageView
    }()

  lazy var closeButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: ImageList.Login.closeButton), forState: .Normal)
    button.addTarget(self, action: "closeButtonDidPress", forControlEvents: .TouchUpInside)

    return button
    }()

  lazy var container: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.clearColor()

    return view
    }()

  weak var delegate: LoginViewControllerDelegate?

  override func viewDidLoad() {
    super.viewDidLoad()

    for subview in [loginButton, logo, emailTextField, passwordTextField] { container.addSubview(subview) }
    for subview in [backgroundView, container, closeButton] { view.addSubview(subview) }

    loginButton.addTarget(self, action: "loginButtonDidPress", forControlEvents: .TouchUpInside)
    setupConstraints()
    transitioningDelegate = transitionManager
    backgroundView.configureView()
    container.frame = view.bounds
  }

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)

    subscribeNotifications()
    emailTextField.textField.becomeFirstResponder()
  }

  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)

    view.endEditing(true)
    
    UIView.animateWithDuration(0.15, animations: {
      self.container.frame.origin.y = 0
    })

    NSNotificationCenter.defaultCenter().removeObserver(self)
  }

  override func prefersStatusBarHidden() -> Bool {
    return true
  }

  // MARK: - Configuration

  func setupConstraints() {
    let totalHeight = UIScreen.mainScreen().bounds.height

    constrain(backgroundView, logo, closeButton) { backgroundView, logo, closeButton in
      backgroundView.top == backgroundView.superview!.top
      backgroundView.left == backgroundView.superview!.left
      backgroundView.width == backgroundView.superview!.width
      backgroundView.height == backgroundView.superview!.height

      logo.centerX == logo.superview!.centerX
      logo.centerY == logo.superview!.centerY - totalHeight / 4 - 30
      logo.width == 150
      logo.height == 90

      closeButton.top == closeButton.superview!.top + 20
      closeButton.left == closeButton.superview!.left + 20
      closeButton.width == 20
      closeButton.height == 20
    }

    constrain(emailTextField, passwordTextField, loginButton) { emailTextField, passwordTextField, loginButton in
      for textField in [emailTextField, passwordTextField] {
        textField.width == textField.superview!.width - SignupScreenTextField.Dimensions.offset
        textField.height == SignupScreenTextField.Dimensions.height
        textField.centerX == textField.superview!.centerX
      }

      loginButton.centerX == loginButton.superview!.centerX
      loginButton.top == loginButton.superview!.centerY + 70
      loginButton.width == loginButton.superview!.width - LoginScreenButton.Dimensions.offset
      loginButton.height == LoginScreenButton.Dimensions.height

      emailTextField.bottom == passwordTextField.top - SignupScreenTextField.Dimensions.offsetBetween
      passwordTextField.bottom == loginButton.top - 36
    }
  }

  func subscribeNotifications() {
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
  }

  // MARK: - Action methods

  func closeButtonDidPress() {
    dismissViewControllerAnimated(true, completion: nil)
  }

  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    view.endEditing(true)
  }

  func loginButtonDidPress() {
    viewWillDisappear(true)
    delegate?.didLoginSuccessfully()
  }

  // MARK: - Notification methods

  func keyboardWillShow(notification: NSNotification) {
    guard let userInfo = notification.userInfo,
      keyboardFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.CGRectValue() else { return }

    let offsetValue: CGFloat = UIScreen.mainScreen().nativeBounds.height == 960 ? 12 : 36
    let value = loginButton.frame.origin.y + loginButton.frame.size.height - (UIScreen.mainScreen().bounds.height - keyboardFrame.height - offsetValue)
    let logoAlpha: CGFloat = UIScreen.mainScreen().nativeBounds.height < 1137 ? 0 : 1

    UIView.animateWithDuration(0.15, animations: {
      self.container.frame.origin.y = -value
      self.logo.alpha = logoAlpha
    })
  }

  func keyboardWillHide(notification: NSNotification) {
    UIView.animateWithDuration(0.15, animations: {
      self.container.frame.origin.y = 0
      self.logo.alpha = 1
    })
  }
}
