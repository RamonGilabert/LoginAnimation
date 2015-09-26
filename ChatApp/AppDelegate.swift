import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  lazy var chatsViewController: ChatsTableViewController = ChatsTableViewController()
  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    window?.rootViewController = chatsViewController
    window?.makeKeyAndVisible()

    return true
  }
}

