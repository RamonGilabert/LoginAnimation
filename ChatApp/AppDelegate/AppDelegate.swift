import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  lazy var chatsViewController: ChatsTableViewController = ChatsTableViewController()
  lazy var loginViewController: LoginViewController = LoginViewController()

  let currentUser = PFUser.currentUser()
  var window: UIWindow?

  func application(application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
      window = UIWindow()
      window?.rootViewController = currentUser != nil ? chatsViewController : loginViewController
      window?.makeKeyAndVisible()

      setupParseConfiguration()

      return true
  }

  // MARK: - Setup

  func setupParseConfiguration() {
    Parse.enableLocalDatastore()
    Parse.setApplicationId(Information.parse.applicationID, clientKey: Information.parse.clientKey)
  }
}

