import UIKit
import Cartography

class SignupViewController: UIViewController {

  lazy var backgroundView: LoginBackgroundView = LoginBackgroundView()
  lazy var signupButton: LoginScreenButton = LoginScreenButton(kind: .Signup)
  lazy var nameTextField: SignupScreenTextField = SignupScreenTextField(kind: .Name)
  lazy var emailTextField: SignupScreenTextField = SignupScreenTextField(kind: .Email)
  lazy var passwordTextField: SignupScreenTextField = SignupScreenTextField(kind: .Password)

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

  override func viewDidLoad() {
    super.viewDidLoad()

    container.frame = view.bounds

    for subview in [signupButton, passwordTextField, emailTextField, nameTextField, logo] { container.addSubview(subview) }
    for subview in [backgroundView, container, closeButton] { view.addSubview(subview) }

    backgroundView.configureView()
    setupConstraints()

    guard UIScreen.mainScreen().nativeBounds.height == 960 else { return }
    logo.removeFromSuperview()
  }

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    setupNotifications()
    nameTextField.textField.becomeFirstResponder()
  }

  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)

    view.endEditing(true)
    container.frame.origin.y = 0

    NSNotificationCenter.defaultCenter().removeObserver(self)
  }

  override func prefersStatusBarHidden() -> Bool {
    return true
  }

  // MARK: - Configuration

  func setupConstraints() {
    let totalHeight = UIScreen.mainScreen().bounds.height

    constrain(signupButton, nameTextField, emailTextField, passwordTextField) { signupButton, nameTextField, emailTextField, passwordTextField in
      signupButton.width == signupButton.superview!.width - LoginScreenButton.Dimensions.offset
      signupButton.height == LoginScreenButton.Dimensions.height
      signupButton.centerX == signupButton.superview!.centerX
      signupButton.centerY == signupButton.superview!.centerY + 100

      for view in [passwordTextField, emailTextField, nameTextField] {
        view.width == view.superview!.width - SignupScreenTextField.Dimensions.offset
        view.height == SignupScreenTextField.Dimensions.height
        view.centerX == view.superview!.centerX
      }

      passwordTextField.bottom == signupButton.top - 20
      emailTextField.bottom == passwordTextField.top - 12
      nameTextField.bottom == emailTextField.top - 12
    }

    constrain(backgroundView, closeButton, logo) { backgroundView, closeButton, logo in
      backgroundView.width == backgroundView.superview!.width
      backgroundView.height == backgroundView.superview!.height
      backgroundView.top == backgroundView.superview!.top
      backgroundView.left == backgroundView.superview!.left

      closeButton.top == closeButton.superview!.top + 20
      closeButton.left == closeButton.superview!.left + 20

      logo.centerX == logo.superview!.centerX
      logo.centerY == logo.superview!.centerY - totalHeight / 4 - 60
      logo.width == 150
      logo.height == 90
    }
  }

  func setupNotifications() {
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

  // MARK: - Notifications

  func keyboardWillShow(notification: NSNotification) {
    guard let userInfo = notification.userInfo,
      keyboardFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.CGRectValue() else { return }

    let offsetValue: CGFloat = UIScreen.mainScreen().nativeBounds.height == 960 ? 12 : 20
    let alternativeOffset: CGFloat = nameTextField.textField.isFirstResponder() ? 55 : 0
    let nameTextFieldAlpha: CGFloat = nameTextField.textField.isFirstResponder() ? 1 : 0
    let value = signupButton.frame.origin.y + signupButton.frame.size.height - (UIScreen.mainScreen().bounds.height - keyboardFrame.height - offsetValue + alternativeOffset)
    let logoAlpha: CGFloat = UIScreen.mainScreen().nativeBounds.height < 1335 ? 0 : 1

    UIView.animateWithDuration(0.15, animations: {
      self.container.frame.origin.y = -value
      self.logo.alpha = logoAlpha
      self.nameTextField.alpha = nameTextFieldAlpha
    })
  }

  func keyboardWillHide(notification: NSNotification) {
    UIView.animateWithDuration(0.2, animations: {
      self.container.frame.origin.y = 0
      self.logo.alpha = 1
      self.nameTextField.alpha = 1
    })
  }
}
