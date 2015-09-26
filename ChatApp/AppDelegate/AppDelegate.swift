import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  lazy var chatsViewController: ChatsTableViewController = ChatsTableViewController()
  var window: UIWindow?

  func application(application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
      window = UIWindow()
      window?.rootViewController = chatsViewController
      window?.makeKeyAndVisible()

      setupParseConfiguration()

      return true
  }

  func setupParseConfiguration() {
    Parse.enableLocalDatastore()
    Parse.setApplicationId(Information.parse.applicationID,
      clientKey: Information.parse.clientKey)
  }
}

