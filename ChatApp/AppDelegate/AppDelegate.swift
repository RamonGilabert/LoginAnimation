import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  lazy var chatsViewController: ChatsTableViewController = ChatsTableViewController()
  lazy var loginViewController: LoginMainViewController = LoginMainViewController()

  let currentUser = PFUser.currentUser()
  var window: UIWindow?

  func application(application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
      window = UIWindow()
      window?.rootViewController = currentUser != nil ? chatsViewController : loginViewController
      window?.makeKeyAndVisible()

      loginViewController.loginViewController.delegate = self
      loginViewController.signupViewController.delegate = self
      setupParseConfiguration()

      return true
  }

  // MARK: - Setup

  func setupParseConfiguration() {
    Parse.enableLocalDatastore()
    Parse.setApplicationId(Information.parse.applicationID, clientKey: Information.parse.clientKey)
  }
}

extension AppDelegate: LoginViewControllerDelegate {

  func didLoginSuccessfully() {
    window = UIWindow()
    window?.rootViewController = chatsViewController
    window?.makeKeyAndVisible()
  }
}

extension AppDelegate: SignupViewControllerDelegate {

  func didSignupSuccessfully() {
    window = UIWindow()
    window?.rootViewController = chatsViewController
    window?.makeKeyAndVisible()
  }
}
