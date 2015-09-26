import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  lazy var chatsViewController: ChatsTableViewController = ChatsTableViewController()
  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    window = UIWindow()
    window?.rootViewController = chatsViewController
    window?.makeKeyAndVisible()

    setupParseConfiguration()

    return true
  }

  func setupParseConfiguration() {
    Parse.enableLocalDatastore()
    Parse.setApplicationId("sP8l2ueODwtmMZ0PPunp4a1urPJ72ZMaIQ5Cy560",
      clientKey: "Ku6j9PilD0ieGu9g89ZkC8ozyZbTx3YCMuT5CmJc")
  }
}

