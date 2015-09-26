import UIKit

struct FontList {

  private struct HelveticaNeue {
    static let regular = "HelveticaNeue"
    static let medium = "HelveticaNeue-Medium"
    static let thinItalic = "HelveticaNeue-ThinItalic"
    static let light = "HelveticaNeue-Light"
  }

  struct Login {
    static let title = UIFont(name: HelveticaNeue.medium, size: 26)!
    static let subtitle = UIFont(name: HelveticaNeue.thinItalic, size: 16)!
    static let button = UIFont(name: HelveticaNeue.regular, size: 20)!
  }
}
