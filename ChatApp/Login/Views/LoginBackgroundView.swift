import UIKit
import Cartography

class LoginBackgroundView: UIView {

  lazy var backgroundImage: UIImageView = {
    let imageView = UIImageView()
    return imageView
    }()

  lazy var blurBackground: UIVisualEffectView = {
    let visualView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))
    return visualView
    }()

  lazy var termsAndConditions: UIButton = {
    let button = UIButton()
    return button
    }()

  func configureView() {
    for subview in [backgroundImage, blurBackground, termsAndConditions] { addSubview(subview) }

    setupConstraints()
  }

  // MARK: - Configuration

  func setupConstraints() {
    constrain(backgroundImage, blurBackground, termsAndConditions) { backgroundImage, blurBackground, termsAndConditions in
      for view in [backgroundImage, blurBackground] {
        view.top == view.superview!.top
        view.left == view.superview!.left
        view.width == view.superview!.width
        view.height == view.superview!.height
      }

      termsAndConditions.centerX == termsAndConditions.superview!.centerX
      termsAndConditions.bottom == termsAndConditions.superview!.bottom - 6
    }
  }
}
