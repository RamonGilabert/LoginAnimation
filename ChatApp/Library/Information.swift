import Foundation

struct Information {

  static let parse: (applicationID: String, clientKey: String) = {
    guard let parse = configuration["Parse"] as? [String: String],
      applicationID = parse["ApplicationID"], clientKey = parse["ClientKey"]
      else {
        print("You need to configure Parse.")
        abort()
    }

    return (applicationID: applicationID, clientKey: clientKey)
  }()

  static let configuration: [String: AnyObject] = {
    guard let information = NSBundle.mainBundle().infoDictionary,
      configuration = information["MainApp"] as? [String: AnyObject] else {
        print("Configuration missing.")
        abort()
    }

    return configuration
  }()
}
